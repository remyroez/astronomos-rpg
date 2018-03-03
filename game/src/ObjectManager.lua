local class = require 'middleclass'
local ObjectManager = class("ObjectManager")

local rx = require 'rx'

local Object = require("Object")

function ObjectManager:initialize(mapManager, spriteManager)
    self.mapManager = mapManager
    self.spriteManager = spriteManager
    self.objects = {}

    self.random_walk_table = { "right", "left", "down", "up", "stay", "stay" }
    self.random_walk_speed = 1 / 60 * 10
end

function ObjectManager:newObject(template)
    local object = Object(template.type, template.properties)
    local properties = template.properties
    if object.type == "npc" then
        object.sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        object:setAnimation(properties["animation"] or "down")
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y - object:getHeight()))
        self:subscribeWalk(
            object,
            properties["walk_type"] or "random_walk",
            properties["walk_duration"] or (1 / 60 * 20 * 10)
        )
    elseif object.type == "player" then
        object.sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        object:setAnimation(properties["animation"] or "down")
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y))
    elseif object.type == "transfer" then
        -- transfer
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y - template.height))
    else
        print("ObjectManager:newObject", "unknown type")
    end
    table.insert(self.objects, object)
    return object
end

function ObjectManager:clearObjects()
    for _, object in ipairs(self.objects) do
        object:finalize()
    end

    self.objects = {}
end

function ObjectManager:subscribeWalk(object, walk_type, walk_duration)
    local subscribe = nil

    if walk_type == "random_walk" then
        subscribe = object.waitStream
            :filter(function (time) return time > walk_duration end)
            :subscribe(
                function (...)
                    self:walkObject(
                        object,
                        self.random_walk_table[math.random(#self.random_walk_table)],
                        self.random_walk_speed
                    )
                    object.resetDelta()
                end
            )
    end

    if not subscribe then
        -- no subscribe
    else
        object:registerSubscribe("walk", subscribe)
    end
end

function ObjectManager:walkObject(object, direction, speed, can_move_out, through)
    can_move_out = can_move_out or false
    local x, y = object:getPosition()
    local tilewidth, tileheight = self.mapManager:getTileDimensions()
    if direction == 'right' then
        x = x + tilewidth
    elseif direction == 'left' then
        x = x - tilewidth
    elseif direction == 'down' then
        y = y + tileheight
    elseif direction == 'up' then
        y = y - tileheight
    end
    self:setObjectDirection(object, direction)
    if not can_move_out and not self.mapManager:inMapFromPixel(x, y) then
        -- can not move out
    elseif through or self:canPassThrough(x, y) then
        object:move(x, y, speed or 1)
    end
end

function ObjectManager:setObjectDirection(object, direction)
    if object.type == 'npc' or object.type == 'player' then
        if not direction then
            -- no direction
        elseif direction == "stay" then
            -- invalid direction
        else
            object:setAnimation(direction)
        end
    end
end

function ObjectManager:canPassThrough(x, y)
    local result = true
    if not self.mapManager:canPassThrough(x, y) then
        -- can not pass through
        result = false
    elseif self:getObjectFromPixel(x, y, "npc") then
        -- object
        result = false
    end
    return result
end

function ObjectManager:getObjectFromTile(x, y, type)
    local object = nil

    for _, obj in ipairs(self.objects) do
        local ox, oy = self.mapManager:convertPixelToTile(obj:getTargetPosition())
        if ox ~= x or oy ~= y then
            -- position not match
        elseif type and type ~= obj.type then
            -- type not match
        else
            object = obj
            break
        end
    end

    return object
end

function ObjectManager:getObjectFromPixel(x, y, type)
    x, y = self.mapManager:convertPixelToTile(x, y)
    return self:getObjectFromTile(x, y, type)
end

function ObjectManager:update(dt)
    for _, object in ipairs(self.objects) do
        local event = object:update(dt)
        if event == "random_walk" then
            self:walkObject(
                object,
                self.random_walk_table[math.random(#self.random_walk_table)],
                self.random_walk_speed
            )
        end
    end
end

return ObjectManager
