local class = require 'middleclass'
local ObjectManager = class("ObjectManager")

local rx = require 'rx'

local const = require 'const'

local Object = require "Object"
local SpriteSheet = require "SpriteSheet"

ObjectManager.SUBSCRIPTION = {
    TWEEN = "tween",
    WALK = "walk"
}

ObjectManager.DEFAULT_SPRITE = "minami"
ObjectManager.DEFAULT_ANIMATION = "down"
ObjectManager.DEFAULT_WALK_TYPE = const.OBJECT.WALK_TYPE.DEFAULT
ObjectManager.DEFAULT_WALK_DURATION = (1 / 60 * 20 * 10)

ObjectManager.DEFAULT_RANDOM_WALK_SPEED = 1 / 60 * 10

local function isTweenableType(type)
    local result = false

    if type == const.OBJECT.TYPE.NPC then
        result = true
    elseif type == const.OBJECT.TYPE.PLAYER then
        result = true
    elseif type == const.OBJECT.TYPE.TRANSFER then
        result = false
    else
        result = false
    end

    return result
end

function ObjectManager:initialize(mapManager, spriteManager)
    self.mapManager = mapManager
    self.spriteManager = spriteManager
    self.objects = {}

    self.random_walk_table = {
        const.DIRECTION.RIGHT,
        const.DIRECTION.LEFT,
        const.DIRECTION.DOWN,
        const.DIRECTION.UP,
        const.DIRECTION.STAY,
        const.DIRECTION.STAY
    }
    self.random_walk_speed = ObjectManager.DEFAULT_RANDOM_WALK_SPEED
end

function ObjectManager:newObject(template)
    local object = Object(template)
    local properties = template.properties
    local hasTween = false
    if object.type == const.OBJECT.TYPE.NPC then
        object.sprite = self.spriteManager:newSpriteInstance(
            properties[const.OBJECT.PROPERTY.SPRITE] or ObjectManager.DEFAULT_SPRITE
        )
        object:setAnimation(
            properties[const.OBJECT.PROPERTY.ANIMATION] or ObjectManager.DEFAULT_ANIMATION
        )
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y - object:getHeight()))
        self:subscribeWalk(
            object,
            properties[const.OBJECT.PROPERTY.WALK_TYPE] or const.OBJECT.WALK_TYPE.DEFAULT,
            properties[const.OBJECT.PROPERTY.WALK_DURATION] or const.OBJECT.WALK_DURATION.DEFAULT
        )
        hasTween = true
    elseif object.type == const.OBJECT.TYPE.PLAYER then
        object.sprite = self.spriteManager:newSpriteInstance(
            properties[const.OBJECT.PROPERTY.SPRITE] or ObjectManager.DEFAULT_SPRITE
        )
        object:setAnimation(
            properties[const.OBJECT.PROPERTY.ANIMATION] or ObjectManager.DEFAULT_ANIMATION
        )
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y))
        hasTween = true
    elseif object.type == const.OBJECT.TYPE.TRANSFER then
        -- transfer
        object:setPosition(self.mapManager:convertPixelToPixel(template.x, template.y - template.height))
    else
        print("ObjectManager:newObject", "unknown type")
    end

    if hasTween then
        object:registerSubscribe(
            ObjectManager.SUBSCRIPTION.TWEEN,
            object.update
                :filter(function (dt) return object.tween end)
                :subscribe(
                    function (self, dt)
                        if self.tween:update(dt) then
                            -- complete
                            self.tween = nil
                            self.target = nil
                            self.resetDelta()
                            self.onArrival(self:getPosition())
                        end
                        if self.sprite then
                            self.sprite:updateSpriteBatch()
                            self.x, self.y = self.sprite.x, self.sprite.y
                        end
                    end
                )
        )
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

    if walk_type == const.OBJECT.WALK_TYPE.RANDOM_WALK then
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
        object:registerSubscribe(ObjectManager.SUBSCRIPTION.WALK, subscribe)
    end
end

function ObjectManager:walkObject(object, direction, speed, can_move_out, through)
    if direction == const.DIRECTION.STAY then
        return
    end
    can_move_out = can_move_out or false
    local x, y = object:getPosition()
    local tilewidth, tileheight = self.mapManager:getTileDimensions()
    if direction == const.DIRECTION.RIGHT then
        x = x + tilewidth
    elseif direction == const.DIRECTION.LEFT then
        x = x - tilewidth
    elseif direction == const.DIRECTION.DOWN then
        y = y + tileheight
    elseif direction == const.DIRECTION.UP then
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
    if object.type == const.OBJECT.TYPE.NPC or object.type == const.OBJECT.TYPE.PLAYER then
        if not direction then
            -- no direction
        elseif direction == const.DIRECTION.DOWN then
            object:setAnimation(SpriteSheet.ANIMATION.DOWN)
        elseif direction == const.DIRECTION.LEFT then
            object:setAnimation(SpriteSheet.ANIMATION.LEFT)
        elseif direction == const.DIRECTION.UP then
            object:setAnimation(SpriteSheet.ANIMATION.UP)
        elseif direction == const.DIRECTION.RIGHT then
            object:setAnimation(SpriteSheet.ANIMATION.RIGHT)
        else
            -- invalid direction
        end
    end
end

function ObjectManager:canPassThrough(x, y)
    local result = true
    if not self.mapManager:canPassThrough(x, y) then
        -- can not pass through
        result = false
    elseif self:getObjectFromPixel(x, y, const.OBJECT.TYPE.NPC) then
        -- object
        result = false
    end
    return result
end

function ObjectManager:getObjectFromTile(x, y, type)
    local object = nil

    for _, obj in ipairs(self.objects) do
        if not obj:inObject(x, y) then
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
    return self:getObjectFromTile(x, y, type)
end

function ObjectManager:update(dt)
    for _, object in ipairs(self.objects) do
        object:update(dt)
    end
end

return ObjectManager
