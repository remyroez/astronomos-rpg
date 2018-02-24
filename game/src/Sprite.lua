local class = require 'middleclass'
local Sprite = class("Sprite")

local anim8 = require 'anim8'

function Sprite:initialize()
    self.animations = {}
    self.current_animation = nil
end

function Sprite:clone()
    local sprite = Sprite()
    
    for key, animation in pairs(self.animations) do
        sprite.animations[key] = animation:clone()
    end

    return sprite
end

function Sprite:newAnimation(name, grid, speed)
    self.animations[name] = anim8.newAnimation(grid, speed)
end

function Sprite:drawAnimation(name, x,y, angle, sx, sy, ox, oy, kx, ky)
    if not self.animations[name] then
        -- no animation
    else
        self.animations[name]:draw(x,y, angle, sx, sy, ox, oy, kx, ky)
    end
end

return Sprite