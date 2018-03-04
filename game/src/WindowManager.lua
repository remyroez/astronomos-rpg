local class = require 'middleclass'
local WindowManager = class("WindowManager")

require 'util'

local gfx = love.graphics

function WindowManager:initialize(image, fontWidth, fontHeight)
    self.image = image
    self.fontWidth = fontWidth or 8
    self.fontHeight = fontHeight or 8

    self.windows = {}
    self.quads = {}

    self.batch = love.graphics.newSpriteBatch(self.image)

    if self.image then
        self:setupFont()
    end
end

function WindowManager:setupFont(image, fontWidth, fontHeight)
    self.image = image or self.image
    self.fontWidth = fontWidth or self.fontWidth
    self.fontHeight = fontHeight or self.fontHeight

    if not self.image then
        -- no image
    else
        self.quads = {}
    
        local numX = math.floor(self.image:getWidth() / self.fontWidth)
        local numY = math.floor(self.image:getHeight() / self.fontHeight)

        for i = 0, numY - 1 do
            for j = 0, numX - 1 do
                table.insert(
                    self.quads,
                    gfx.newQuad(
                        j * self.fontWidth,
                        i * self.fontHeight,
                        self.fontWidth,
                        self.fontHeight,
                        self.image:getDimensions()
                    )
                )
            end
        end
    end
end

function WindowManager:newWindow(name)
    local window = {}
    return window
end

function WindowManager:update(dt)
    for _, window in ipairs(self.windows) do
        --window:update(dt)
    end
end

function WindowManager:draw()
end

return WindowManager