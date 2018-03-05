local class = require 'middleclass'
local Window = class("Window")

local gfx = love.graphics

local tween = require 'tween'

function Window:initialize(font, x, y, width, height, frame)
    assert(font)

    self.font = font
    self.x = (x or 0)
    self.y = (y or 0)
    self.width = width or math.floor(love.graphics.getWidth() / self.font.width)
    self.height = height or math.floor(love.graphics.getHeight() / self.font.height)
    self.frame = frame or false

    self.texts = {}
    self.windows = {}
    self.dirty = true
    
    self.batch = self.font:newBatch()
end

function Window:print(text, x, y)
    table.insert(self.texts, { text = text or "", x = x or 0, y = y or 0, index = 0 })
    self.dirty = true
end

function Window:clear()
    self.texts = {}
end

function Window:push(x, y, w, h)
    local window = Window(self.font, x, y, w, h)
    table.insert(self.windows, window)
    return window
end

function Window:pop()
    if #self.windows > 0 then
        table.remove(self.windows)
    end
end

function Window:window()
    return self.windows[#self.windows]
end

function Window:flushText(text)
    local glyphs = self.font:getGlyphs(text.text)

    local x, y = self.x + text.x, self.y + text.y
    for i, glyph in ipairs(glyphs) do
        if not glyph then
            -- no glyph
        else
            for _, part in ipairs(glyph) do
                local ofsx, ofsy = 0, 0
                if part.character then
                    ofsx = part.character.x or 0
                    ofsy = part.character.y or 0
                end
                self.batch:add(
                    part.quad,
                    (x + ofsx) * self.font.width,
                    (y + ofsy) * self.font.height
                )
            end
        end
        x = x + (glyph.advance or 1)
    end
end

function Window:flush()
    self.batch:clear()
    for _, text in ipairs(self.texts) do
        self:flushText(text)
    end
end

function Window:update(dt)
    for _, text in ipairs(self.texts) do
        if not text.tween then
            -- no tween
        else
            local index = math.floor(text.index)
            text.tween:update(dt)
            if index ~= math.floor(text.index) then
                self.dirty = true
            end
        end
    end

    if self.dirty then
        self:flush()
        self.dirty = false
    end

    for _, window in ipairs(self.windows) do
        window:update(dt)
    end
end

function Window:draw()
    gfx.draw(
        self.batch,
        math.floor(self.x * self.font.width),
        math.floor(self.y * self.font.height)
    )

    for _, window in ipairs(self.windows) do
        window:draw()
    end
end

return Window