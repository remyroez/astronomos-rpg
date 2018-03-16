local class = require 'middleclass'
local BitmapFont = class("BitmapFont")

local gfx = love.graphics

local utf8 = require 'utf8'

local BitmapGlyph = require 'BitmapGlyph'

function BitmapFont:initialize(image, fontWidth, fontHeight, line_height)
    self.image = image
    self.width = fontWidth or 8
    self.height = fontHeight or 8

    self.line_height = line_height or 1

    self.quads = {}
    self.characters = {}
    self.glyphs = {}
    self.error_glyph = BitmapGlyph()
    
    if self.image then
        self:setupQuads()
        self.error_glyph:registerCharacter(nil, self.quads[#self.quads])
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

function BitmapFont:setupGlyphs()
    self.glyphs = {}

    for key, typography in pairs(self.characters) do
        local glyph = BitmapGlyph(key)
            
        if not typography then
            -- no typography
            glyph:registerCharacter(nil, self.quads[#self.quads])
        elseif not typography.index then
            -- any parts
            if #typography > 0 then
                for _, part in ipairs(typography) do
                    if not self.quads[part.index + 1] then
                        -- no quad
                        glyph:registerCharacter(part, self.quads[#self.quads])
                    else
                        glyph:registerCharacter(part, self.quads[part.index + 1])
                    end
                end
            else
                -- other
                glyph:registerCharacter(typography)
            end
        else
            -- single part
            glyph:registerCharacter(typography, self.quads[typography.index + 1])
        end

        self.glyphs[key] = glyph
    end
end

function BitmapFont:getGlyph(name)
    return self.glyphs[name] or self.error_glyph
end

function BitmapFont:getGlyphs(codes)
    local glyphs = {}

    if type(codes) == "string" then
        codes = self:toCodes(codes)
    end

    for _, name in ipairs(codes) do
        table.insert(glyphs, self:getGlyph(name))
    end

    return glyphs
end

function BitmapFont:toCodes(text)
    local codes = {}
    local mode = nil
    local word = ""
    for p, c in utf8.codes(text) do
        local char = utf8.char(c)
        if mode == 'escape' then
            table.insert(codes, char)
            mode = nil
        elseif mode == 'word' then
            if char == '>' then
                table.insert(codes, word)
                word = ""
                mode = nil
            else
                word = word .. char
            end
        elseif char == '\\' then
            mode = 'escape'
        elseif char == '<' then
            mode = 'word'
        else
            table.insert(codes, char)
        end
    end
    return codes
end

return BitmapFont