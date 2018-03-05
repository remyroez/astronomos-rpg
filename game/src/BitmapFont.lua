local class = require 'middleclass'
local BitmapFont = class("BitmapFont")

local gfx = love.graphics

local utf8 = require 'utf8'

function BitmapFont:initialize(image, fontWidth, fontHeight, line_height)
    self.image = image
    self.width = fontWidth or 8
    self.height = fontHeight or 8

    self.line_height = line_height or self.height

    self.quads = {}
    self.characters = {}
    
    if self.image then
        self:setupQuads()
    end
end

function BitmapFont:newBatch()
    return gfx.newSpriteBatch(self.image)
end

function BitmapFont:setupQuads(image, fontWidth, fontHeight, line_height)
    self.image = image or self.image
    self.width = fontWidth or self.width
    self.height = fontHeight or self.height
    self.line_height = line_height or self.line_height

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

function BitmapFont:getGlyph(name)
    local glyph = {}

    local character = self.characters[name]

    if not character then
        -- no character
    elseif not character.index then
        -- any characters
        for _, c in ipairs(character) do
            if not self.quads[c.index + 1] then
                -- no quad
            else
                table.insert(
                    glyph,
                    {
                        quad = self.quads[c.index + 1],
                        character = c
                    }
                )
            end
        end
    else
        glyph = {
            {
                quad = self.quads[character.index + 1],
                character = character
            }
        }
    end

    if #glyph == 0 then
        glyph = {
            {
                quad = self.quads[#self.quads],
            }
        }
    end

    return glyph
end

function BitmapFont:getGlyphs(character_names)
    local glyphs = {}

    if type(character_names) == "string" then
        local codes = {}
        for p, c in utf8.codes(character_names) do
            table.insert(codes, utf8.char(c))
        end
        character_names = codes
    end

    for _, name in ipairs(character_names) do
        table.insert(glyphs, self:getGlyph(name))
    end

    return glyphs
end

return BitmapFont