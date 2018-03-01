local class = require 'middleclass'
local Object = class("Object")

local tween = require 'tween'
local rx = require 'rx'

local function isTweenableType(type)
    local result = false

    if type == 'npc' then
        result = true
    elseif type == 'player' then
        result = true
    elseif type == 'transfer' then
        result = false
    else
        result = false
    end

    return result
end

function Object:initialize(type, properties)
    self.type = type or "unknown"
    self.properties = properties or {}

    self.sprite = nil
    self.tween = nil

    self.x = 0
    self.y = 0

    self.target = nil

    self.subscribes = {}

    self.update = rx.Subject.create()

    if isTweenableType(self.type) then
        self:registerSubscribe(
            "tween",
            self.update
            :filter(function (dt) return self.tween end)
            :subscribe(
                function (self, dt)
                    if self.tween:update(dt) then
                        -- complete
                        self.tween = nil
                        self.target = nil
                        self.resetDelta()
                        self.onArrival(self:getPosition())
                    end
                    self.sprite:updateSpriteBatch()
                end
            )
        )
    end

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

function Object:state()
    if self.tween then
        return "moving"
    else
        return "ready"
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

function Object:getDimensions()
    if not self.sprite then
        -- no sprite
        return 0, 0
    else
        return self.sprite:getWidth(), self.sprite:getHeight()
    end
end

function Object:getWidth()
    local value, _ = self:getDimensions()
    return value
end

function Object:getHeight()
    local _, value = self:getDimensions()
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
