local class = require 'middleclass'
local Object = class("Object")

local tween = require 'tween'

function Object:initialize(type)
    self.type = type

    self.sprite = nil
    self.event = nil
    self.duration = nil
    self.timer = 0
    self.tween = nil
    self.commands = {}

    self.target = nil
end

function Object:state()
    if self.tween then
        return "moving"
    else
        return "ready"
    end
end

function Object:setRoutine(event, duration)
    self.event = event
    self.duration = duration
end

function Object:move(x, y, seconds)
    if not self.sprite then
        -- no sprite
    else
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
    self.timer = 0
    self.tween = nil
    self.target = nil
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

function Object:update(dt)
    local event = ""

    if not self.tween then
        -- no tween
        if self.event and self.duration then
            self.timer = self.timer + dt
            if self.timer > self.duration then
                self.timer = 0
                event = self.event
            else
                event = nil
            end
        else
            event = nil
        end
    else
        if self.tween:update(dt) then
            -- complete
            self.tween = nil
            self.timer = 0
            self.target = nil
            event = "moved"
        end
        self.sprite:updateSpriteBatch()
    end

    return event
end

return Object
