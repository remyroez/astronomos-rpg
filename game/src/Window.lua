local class = require 'middleclass'
local Window = class("Window")

local gfx = love.graphics

local tween = require 'tween'

Window.DEFAULT_FRAMES = {
    background = "background",
    top = "horizontal_frame",
    bottom = "horizontal_frame",
    left = "vertical_frame",
    right = "vertical_frame",
    left_top = "left_top_frame",
    right_top = "right_top_frame",
    left_bottom = "left_bottom_frame",
    right_bottom = "right_bottom_frame",
    button = "button",
    cursor = "cursor",
}

Window.OVERFLOW = {
    VISIBLE = 'visible',
    HIDDEN = 'hidden',
    LINEFEED = 'linefeed',
    AUTO = 'auto',
}
Window.OVERFLOW.DEFAULT = Window.OVERFLOW.LINEFEED

function Window:initialize(font, x, y, width, height, frame, background)
    assert(font)

    self.font = font
    self.x = (x or 0)
    self.y = (y or 0)
    self.width = width or (math.floor(love.graphics.getWidth() / self.font.width) - self.x)
    self.height = height or (math.floor(love.graphics.getHeight() / self.font.height) - self.y)
    self.frame = frame or false
    self.background = background or self.frame or false

    self.messages = {}
    self.frames = {}
    self.windows = {}
    self.overflow = Window.OVERFLOW.DEFAULT
    self.scrolls = { h = 0, v = 0 }
    self.button = { visible = false, tween = nil, value = 0 }
    self.dirty = true
    
    self.batch = self.font:newBatch()

    if self.frame then
        self:setupFrames()
    end
end

function Window:left()
    return self.x
end

function Window:top()
    return self.y
end

function Window:right()
    return self.x + self.width
end

function Window:bottom()
    return self.y + self.height
end

function Window:print(text, x, y, speed)
    local message = {
        text = text or "",
        glyphs = self.font:getGlyphs(text),
        x = x,
        y = y,
        speed = speed,
        index = 0,
        id = #self.messages
    }
    if speed then
        message.tween = tween.new(
            #message.glyphs * speed,
            message,
            { index = #message.glyphs }
        )
    end
    table.insert(self.messages, message)
    self.dirty = true
    return self
end

function Window:hscroll(h)
    self.scrolls.h = self.scrolls.h + h
    self.dirty = true
end

function Window:vscroll(v)
    self.scrolls.v = self.scrolls.v + v
    self.dirty = true
end

function Window:scroll(h, v)
    self.hscroll(h)
    self:vscroll(v)
end

function Window:clear()
    self.messages = {}
    self.dirty = true
end

function Window:push(...)
    local window = Window(self.font, ...)
    table.insert(self.windows, window)
    return window
end

function Window:pop()
    if #self.windows > 0 then
        table.remove(self.windows)
    end
    return self:window()
end

function Window:window()
    return self.windows[#self.windows]
end

function Window:resetButton(second, visible)
    self.button.value = 0
    self.button.seconds = second or self.button.seconds
    if not self.button.seconds then
        self.button.visible = false
        self.button.tween = nil
    else
        self.button.visible = visible or not self.button.visible
        self.button.tween = tween.new(
            self.button.seconds or 1,
            self.button,
            { value = 1 }
        )
    end
    self.dirty = true
end

function Window:setupFrames(frames)
    frames = frames or Window.DEFAULT_FRAMES
    self.frames = {}
    for part, name in pairs(frames) do
        self.frames[part] = self.font:getGlyph(name)
    end
    self.dirty = true
end

function Window:putGlyph(glyph, x, y, left, top, right, bottom)
    left = left or self:left()
    top = top or self:top()
    right = right or self:right()
    bottom = bottom or self:bottom()

    if not glyph then
        -- no glyph
    else
        for _, part in ipairs(glyph) do
            local putx, puty = x, y
            if part.character then
                putx = putx + (part.character.x or 0)
                puty = puty + (part.character.y or 0)
            end
            if putx < left then
                -- out of left
            elseif putx >= right then
                -- out of right
            elseif puty < top then
                -- out of top
            elseif puty >= bottom then
                -- out of bottom
            else
                self.batch:add(
                    part.quad,
                    putx * self.font.width,
                    puty * self.font.height
                )
            end
        end
    end
end

function Window:flushBackground()
    if not self.frames.background then
        -- no background
    else
        local glyph = self.frames.background
        for i = self:top() + 1, self:bottom() - 2 do
            for j = self:left() + 1, self:right() - 2 do
                self:putGlyph(glyph, j, i)
            end
        end
    end
end

function Window:flushMessage(message, cx, cy)
    local glyphs = message.glyphs
    if not glyphs then
        message.glyphs = self.font:getGlyphs(message.text)
        glyphs = message.glyphs
    end

    local ofsx, ofsy = (self:left() + self.scrolls.h), (self:top() + self.scrolls.v)

    local left, top = self:left(), self:top()
    local right, bottom = self:right(), self:bottom()

    -- frame padding
    if self.frame then
        left, top, right, bottom = left + 1, top + 1, right - 1, bottom - 1
        ofsx, ofsy = ofsx + 1, ofsy + 1
    end
    
    local x, y = (message.x or cx) + ofsx, (message.y or cy) + ofsy

    local beginx, beginy = x, y
    local wordwrap = right + self.scrolls.h

    local index = #glyphs
    if message.tween then
        index = math.floor(message.index)
    end

    local visible = true
    for i, glyph in ipairs(glyphs) do
        if i > index then
            -- before index
        else
            -- x check
            if x < left then
                visible = false
            elseif x < wordwrap then
                visible = true
            elseif self.overflow == Window.OVERFLOW.VISIBLE then
                visible = true
            elseif self.overflow == Window.OVERFLOW.HIDDEN then
                visible = false
            elseif self.overflow == Window.OVERFLOW.LINEFEED then
                x, y = beginx, y + self.font.line_height
                visible = true
            end
    
            -- y check
            if y < top then
                visible = false
            elseif y < bottom then
                -- ok
            elseif self.overflow == Window.OVERFLOW.VISIBLE then
                -- ok
            elseif self.overflow == Window.OVERFLOW.HIDDEN then
                visible = false
            elseif self.overflow == Window.OVERFLOW.LINEFEED then
                visible = false
            end
    
            -- put
            if visible then
                self:putGlyph(glyph, x, y, left, top, right, bottom)
            end
    
            -- advance
            x = x + (glyph.advance or 1)
        end
    end
    
    x, y = beginx - ofsx, y + self.font.line_height - ofsy
    
    return x, y
end

function Window:flushFrame()
    for part, glyph in pairs(self.frames) do
        if part == 'left_top' then
            self:putGlyph(glyph, self:left(), self:top())
        elseif part == 'right_top' then
            self:putGlyph(glyph, self:right() - 1, self:top())
        elseif part == 'left_bottom' then
            self:putGlyph(glyph, self:left(), self:bottom() - 1)
        elseif part == 'right_bottom' then
            self:putGlyph(glyph, self:right() - 1, self:bottom() - 1)
        elseif part == 'left' then
            for i = 1, self.height - 2 do
                self:putGlyph(glyph, self:left(), self:top() + i)
            end
        elseif part == 'right' then
            for i = 1, self.height - 2 do
                self:putGlyph(glyph, self:right() - 1, self:top() + i)
            end
        elseif part == 'top' then
            for i = 1, self.width - 2 do
                self:putGlyph(glyph, self:left() + i, self:top())
            end
        elseif part == 'bottom' then
            for i = 1, self.width - 2 do
                self:putGlyph(glyph, self:left() + i, self:bottom() - 1)
            end
        else
        end
    end
end

function Window:flushButton()
    if not self.frames['button'] then
        -- no quad
    else
        local x = self:left() + math.floor(self.width / 2)
        local y = self:bottom() - 1
        if self.frame then
            y = y - 1
        end
        self:putGlyph(self.frames['button'], x, y)
    end
end

function Window:flush()
    self.batch:clear()
    if self.background then
        self:flushBackground()
    end
    local x, y = 0, self.font.line_height - 1
    for _, message in ipairs(self.messages) do
        x, y = self:flushMessage(message, x, y)
    end
    if self.frame then
        self:flushFrame()
    end
    if self.button.visible then
        self:flushButton()
    end
end

function Window:update(dt)
    -- button
    if self.button.tween then
        if self.button.tween:update(dt) then
            self:resetButton()
        end
    end

    -- messages
    for _, message in ipairs(self.messages) do
        if not message.tween then
            -- no tween
        else
            local index = math.floor(message.index)
            if message.tween:update(dt) then
                message.tween = nil
            end
            if index ~= math.floor(message.index) then
                self.dirty = true
            end
        end
    end

    -- flush
    if self.dirty then
        self:flush()
        self.dirty = false
    end

    -- children
    for _, window in ipairs(self.windows) do
        window:update(dt)
    end
end

function Window:draw()
    gfx.draw(self.batch)

    for _, window in ipairs(self.windows) do
        window:draw()
    end
end

return Window