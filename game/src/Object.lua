local class = require 'middleclass'
local Object = class("Object")

local tween = require 'tween'
local rx = require 'rx'

local const = require 'const'

Object.STATE = {
    MOVING = "moving",
    READY = "ready"
}

function Object:initialize(object)
    assert(object)

    self.object = object

    self.type = object.type or const.OBJECT.TYPE.UNKNOWN
    self.properties = object.properties or {}

    self.x = object.x or 0
    self.y = object.y or 0
    self.width = object.width or 0
    self.height = object.height or 0

    self.sprite = nil
    self.tween = nil
    self.target = nil

    self.subscribes = {}

    self.update = rx.Subject.create()

    self.onArrival = rx.Subject.create()

    self.resetDelta = rx.Subject.create()

    self.waitStream = self.update
        :map(
            function (object, dt)
                return { dt = dt, reset = false }
            end
        )
        :merge(
            self.resetDelta
                :map(
                    function (...)
                        return { dt = 0, reset = true }
                    end
                )
        )
        :scan(
            function (acc, value)
                return value.reset and 0 or acc + value.dt
            end,
            0
        )
end

function Object:finalize()
    self.sprite = nil
    self.tween = nil

    self:deregisterSubscribes()
end

function Object:registerSubscribe(name, subscribe)
    self:deregisterSubscribe(name)
    self.subscribes[name] = subscribe
end

function Object:deregisterSubscribe(name)
    if not self.subscribes[name] then
        -- subscribe not found
    else
        self.subscribes[name]:unsubscribe()
        self.subscribes[name] = nil
    end
end

function Object:deregisterSubscribes()
    for key, subscription in pairs(self.subscribes) do
        if subscription then
            subscription:unsubscribe()
        end
    end
    self.subscribes = {}
end

function Object:state()
    if self.tween then
        return Object.STATE.MOVING
    else
        return Object.STATE.READY
    end
end

function Object:move(x, y, seconds)
    if self.target then
        self:setPosition(self:getTargetPosition())
    end
    self.target = {
        x = x,
        y = y
    }
    self.tween = tween.new(
        seconds or 1,
        self.sprite or self,
        self.target
    )
end

function Object:setPosition(x, y)
    self.tween = nil
    self.target = nil
    self.resetDelta()
    if self.sprite then
        self.sprite.x = x
        self.sprite.y = y
        self.sprite:updateSpriteBatch()
    end
    self.x = x
    self.y = y
end

function Object:getPosition()
    if not self.sprite then
        -- no sprite
        return self.x, self.y
    else
        return self.sprite.x, self.sprite.y
    end
end

function Object:left()
    return self.x
end

function Object:top()
    return self.y
end

function Object:right()
    return self:left() + self.width
end

function Object:bottom()
    return self:top() + self.height
end

function Object:inObject(x, y)
    return (x >= self:left()) and (y >= self:top()) and (x < self:right()) and (y < self:bottom())
end

function Object:getDimensions()
    return self.width, self.height
end

function Object:getWidth()
    local value, _ = self:getDimensions()
    return value
end

function Object:getHeight()
    local _, value = self:getDimensions()
    return value
end

function Object:getObjectDimensions()
    if not self.object then
        -- no sprite
        return 0, 0
    else
        return self.object.width, self.object.height
    end
end

function Object:getObjectWidth()
    local value, _ = self:getObjectDimensions()
    return value
end

function Object:getObjectHeight()
    local _, value = self:getObjectDimensions()
    return value
end

function Object:getSpriteDimensions()
    if not self.sprite then
        -- no sprite
        return 0, 0
    else
        return self.sprite:getWidth(), self.sprite:getHeight()
    end
end

function Object:getSpriteWidth()
    local value, _ = self:getSpriteDimensions()
    return value
end

function Object:getSpriteHeight()
    local _, value = self:getSpriteDimensions()
    return value
end

function Object:getTargetPosition()
    if not self.target then
        -- no target
        return self:getPosition()
    else
        return self.target.x, self.target.y
    end
end

function Object:setAnimation(name)
    if not self.sprite then
        -- no sprite
    else
        self.sprite:set(name)
    end
end

return Object
