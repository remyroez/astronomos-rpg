local class = require 'middleclass'
local BitmapGlyph = class("BitmapGlyph")

function BitmapGlyph:initialize(name)
    --self.name = name or 'unknown'
    self.characters = {}
    self.advance = 1
end

function BitmapGlyph:registerCharacter(typography, quad)
    -- insert character
    table.insert(
        self.characters,
        {
            quad = quad,
            typography = typography,
            character = typography
        }
    )

    -- update advance
    if typography and typography.advance then
        self.advance = typography.advance
    end
end

function BitmapGlyph:attributes(name)
    local attributes = {}

    for _, character in ipairs(self.characters) do
        if character[name] then
            table.insert(attributes, character[name])
        end
    end

    return attributes
end

function BitmapGlyph:quads()
    return self:attributes('quad')
end

function BitmapGlyph:typographies()
    return self:attributes('typography')
end

function BitmapGlyph:controls()
    local typographies = self:typographies()

    local controls = {}
    for _, typography in ipairs(typographies) do
        if typography.control then
            table.insert(controls, typography.control)
        end
    end

    return controls
end

function BitmapGlyph:drawable()
    return #self:quads() > 0
end

function BitmapGlyph:controlable()
    return #self:controls() > 0
end

return BitmapGlyph
