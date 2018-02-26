local class = require 'middleclass'
local ObjectManager = class("ObjectManager")

local Object = require("Object")

function ObjectManager:initialize(mapManager, spriteManager)
    self.mapManager = mapManager
    self.spriteManager = spriteManager
    self.objects = {}

    self.random_walk_table = { "right", "left", "down", "up", "stay", "stay" }
    self.random_walk_speed = 1 / 60 * 10
end

function ObjectManager:newObject(template)
    local object = Object(template.type)
    local properties = template.properties
    if object.type == "npc" then
        local sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        sprite:set(properties["animation"] or "down")
        sprite.x = template.x
        sprite.y = template.y - sprite:getHeight() -- bottom -> top
        object.sprite = sprite
        object.event = properties["walk_type"] or "random_walk"
        object.duration = properties["walk_duration"] or (1 / 60 * 20 * 10)
    elseif object.type == "player" then
        local sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        sprite:set(properties["animation"] or "down")
        sprite.x = template.x
        sprite.y = template.y
        object.sprite = sprite
    else
        print("error")
    end
    table.insert(self.objects, object)
    return object
end

function ObjectManager:clearObjects()
    self.objects = {}
end

function ObjectManager:walkObject(object, direction, speed, can_move_out)
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
    elseif self.mapManager:canPassThrough(x, y) then
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
