local class = require 'middleclass'
local BitmapFont = class("BitmapFont")

local gfx = love.graphics

function BitmapFont:initialize(image, fontWidth, fontHeight)
    self.image = image
    self.width = fontWidth or 8
    self.height = fontHeight or 8

    self.quads = {}
    self.characters = {}
    self.batch = nil
    self.dirty = false
    
    if self.image then
        self:setupFont()
    end
end

function BitmapFont:setup(image, fontWidth, fontHeight)
    if image ~= self.image then
        self:clearSpriteBatch()
        self.batch = nil
    end

    self.image = image or self.image
    self.width = fontWidth or self.width
    self.height = fontHeight or self.height

    if not self.image then
        -- no image
    else
        if not self.batch then
            self.batch = gfx.newSpriteBatch(self.image)
        end

        self.quads = {}
    
        local numX = math.floor(self.image:getWidth() / self.width)
        local numY = math.floor(self.image:getHeight() / self.height)

        for i = 0, numY - 1 do
            for j = 0, numX - 1 do
                table.insert(
                    self.quads,
                    gfx.newQuad(
                        j * self.width,
                        i * self.height,
                        self.width,
                        self.height,
                        self.image:getDimensions()
                    )
                )
            end
        end
    end
end

function BitmapFont:clearSpriteBatch()
    if not self.batch then
        -- no batch
    else
        self.batch:clear()
    end
end

function BitmapFont:draw(...)
    if self.batch then
        gfx.draw(self.batch, ...)
    end
end

return BitmapFont