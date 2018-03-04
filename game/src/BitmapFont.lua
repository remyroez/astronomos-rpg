local class = require 'middleclass'
local BitmapFont = class("BitmapFont")

local gfx = love.graphics

function BitmapFont:initialize(image, fontWidth, fontHeight)
    self.image = image
    self.width = fontWidth or 8
    self.height = fontHeight or 8

    self.quads = {}
    self.characters = {}
    
    if self.image then
        self:setupQuads()
    end
end

function BitmapFont:newBatch()
    return gfx.newSpriteBatch(self.image)
end

function BitmapFont:setupQuads(image, fontWidth, fontHeight)
    self.image = image or self.image
    self.width = fontWidth or self.width
    self.height = fontHeight or self.height

    if not self.image then
        -- no image
    else
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

function BitmapFont:getQuad(character_name)
    local quad

    local character = self.characters[character_name]

    if not character then
        -- no character
    elseif not character.index then
        -- no index
    elseif not self.quads[character.index + 1] then
        -- no quad
    else
        quad = self.quads[character.index + 1]
    end

    return quad
end

function BitmapFont:getQuads(character_names)
    local quads = {}

    for _, character_name in ipairs(character_names) do
        table.insert(quads, self:getQuad(character_name))
    end

    return quads
end

return BitmapFont