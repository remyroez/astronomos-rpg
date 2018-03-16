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
    if typography and typography.advance and typography.advance > self.advance then
        self.advance = typography.advance
    end
end

function BitmapGlyph:attributes(name)
    local attributes = {}

    for _, character in ipairs(self.characters) do
        table.insert(attributes, character[name])
    end

    return attributes
end

function BitmapGlyph:quads()
    return self:attributes('quads')
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

return BitmapGlyph
