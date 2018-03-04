local class = require 'middleclass'
local Actor = class("Actor")

local tween = require 'tween'
local rx = require 'rx'

local const = require 'const'

Actor.STATE = {
    MOVING = "moving",
    READY = "ready"
}

function Actor:initialize(object)
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

    self.subscriptions = {}

    self.update = rx.Subject.create()

    self.onArrival = rx.Subject.create()

    self.resetDelta = rx.Subject.create()

    self.waitStream = self.update
        :map(
            function (actor, dt)
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

function Actor:finalize()
    self.sprite = nil
    self.tween = nil

    self:deregisterSubscriptions()
end

function Actor:registerSubscription(name, subscribe)
    self:deregisterSubscription(name)
    self.subscriptions[name] = subscribe
end

function Actor:deregisterSubscription(name)
    if not self.subscriptions[name] then
        -- subscribe not found
    else
        self.subscriptions[name]:unsubscribe()
        self.subscriptions[name] = nil
    end
end

function Actor:deregisterSubscriptions()
    for key, subscription in pairs(self.subscriptions) do
        if subscription then
            subscription:unsubscribe()
        end
    end
    self.subscriptions = {}
end

function Actor:state()
    if self.tween then
        return Actor.STATE.MOVING
    else
        return Actor.STATE.READY
    end
end

function Actor:move(x, y, seconds)
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

function Actor:setPosition(x, y)
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

function Actor:getPosition()
    if not self.sprite then
        -- no sprite
        return self.x, self.y
    else
        return self.sprite.x, self.sprite.y
    end
end

function Actor:left()
    return self.x
end

function Actor:top()
    return self.y
end

function Actor:right()
    return self:left() + self.width
end

function Actor:bottom()
    return self:top() + self.height
end

function Actor:inObject(x, y)
    return (x >= self:left()) and (y >= self:top()) and (x < self:right()) and (y < self:bottom())
end

function Actor:getDimensions()
    return self.width, self.height
end

function Actor:getWidth()
    local value, _ = self:getDimensions()
    return value
end

function Actor:getHeight()
    local _, value = self:getDimensions()
    return value
end

function Actor:getObjectDimensions()
    if not self.object then
        -- no sprite
        return 0, 0
    else
        return self.object.width, self.object.height
    end
end

function Actor:getObjectWidth()
    local value, _ = self:getObjectDimensions()
    return value
end

function Actor:getObjectHeight()
    local _, value = self:getObjectDimensions()
    return value
end

function Actor:getSpriteDimensions()
    if not self.sprite then
        -- no sprite
        return 0, 0
    else
        return self.sprite:getWidth(), self.sprite:getHeight()
    end
end

function Actor:getSpriteWidth()
    local value, _ = self:getSpriteDimensions()
    return value
end

function Actor:getSpriteHeight()
    local _, value = self:getSpriteDimensions()
    return value
end

function Actor:getTargetPosition()
    if not self.target then
        -- no target
        return self:getPosition()
    else
        return self.target.x, self.target.y
    end
end

function Actor:setAnimation(name)
    if not self.sprite then
        -- no sprite
    else
        self.sprite:set(name)
    end
end

return Actor
