local class = require 'middleclass'
local Window = class("Window")

local gfx = love.graphics

function Window:initialize(font, x, y, w, h)
    self.font = font

    self.x = x or 0
    self.y = y or 0
    self.width = w or 0
    self.height = h or 0

    self.dirty = false
end

function Window:update(dt)
end

function Window:draw()
end

return Window