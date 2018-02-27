local class = require 'middleclass'
local Object = class("Object")

local tween = require 'tween'
local rx = require 'rx'

function Object:initialize(type)
    self.type = type

    self.sprite = nil
    self.tween = nil

    self.target = nil

    self.subscribes = {}

    self.update = rx.Subject.create()
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
    if not self.sprite then
        -- no sprite
    else
        if self.target then
            self:setPosition(self:getTargetPosition())
        end
        self.target = {
            x = x,
            y = y
        }
        self.tween = tween.new(
            seconds or 1,
            self.sprite,
            self.target
        )
    end
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
end

function Object:getPosition()
    if not self.sprite then
        -- no sprite
        return 0, 0
    else
        return self.sprite.x, self.sprite.y
    end
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
