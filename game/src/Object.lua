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
        self.tween = tween.new(
            seconds or 1,
            self.sprite,
            { x = (self.sprite.x + x), y = self.sprite.y + y }
        )
        if self.type == 'npc' or self.type == 'player' then
            local anim = "down"
            if x > 0 then
                anim = "right"
            elseif x < 0 then
                anim = "left"
            elseif y > 0 then
                anim = "down"
            elseif y < 0 then
                anim = "up"
            else
                anim = nil
            end
            if anim then
                self:setAnimation(anim)
            end
        end
    end
end

function Object:walk(direction, tilewidth, tileheight, speed)
    local sp = speed or 1
    if direction == 'right' then
        self:move(tilewidth, 0, sp) -- right
    elseif direction == 'left' then
        self:move(-tilewidth, 0, sp) -- left
    elseif direction == 'down' then
        self:move(0, tileheight, sp) -- down
    elseif direction == 'up' then
        self:move(0, -tileheight, sp) -- up
    end
end

function Object:setPosition(x, y)
    self.timer = 0
    self.tween = nil
    if self.sprite then
        self.sprite.x = x
        self.sprite.y = y
        self.sprite:updateSpriteBatch()
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
            event = "moved"
        end
        self.sprite:updateSpriteBatch()
    end

    return event
end

return Object
