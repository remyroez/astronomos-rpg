local class = require 'middleclass'
local WindowManager = class("WindowManager")

local BitmapFont = require 'BitmapFont'
local Window = require 'Window'

local gfx = love.graphics

function WindowManager:initialize(image, fontWidth, fontHeight, lineHeight, width, height)
    self.font = BitmapFont(image, fontWidth, fontHeight, lineHeight)
    self:resize(width, height)

    self.windows = {}

    self:setupFontQuads()
end

function WindowManager:resize(width, height)
    self.width = width or love.graphics.getWidth()
    self.height = height or love.graphics.getHeight()
    self.canvas = love.graphics.newCanvas(self.width, self.height)
    self.canvas:setFilter("nearest", "nearest")
end

function WindowManager:setupFontQuads(image, fontWidth, fontHeight)
    self.font:setupQuads(image, fontWidth, fontHeight)
end

function WindowManager:setupFontGlyphs()
    self.font:setupGlyphs()
end

function WindowManager:setupFont()
    self:setupFontGlyphs()
end

function WindowManager:typographies()
    return self.font.typographies
end

function WindowManager:mergeTypographies(typographies)
    for key, typography in pairs(typographies) do
        self.font.typographies[key] = typography
    end
end

function WindowManager:setTypographies(typographies)
    self.font.typographies = typographies
end

function WindowManager:setAsciiTypographies(glyphs, lower_case)
    lower_case = lower_case or false
    if type(glyphs) == 'boolean' then
        lower_case = glyphs
        glyphs = nil
    end
    
    local typographies = {}

    if not glyphs then
        -- all ascii
        for i = 32, 126 do
            local c = string.char(i)
            typographies[c] = { { index = string.byte(lower_case and c or string.upper(c)) } }
        end
    elseif type(glyphs) == 'string' then
        for i = 1, #glyphs do
            local c = string.sub(glyphs, i, i)
            typographies[c] = { { index = string.byte(lower_case and c or string.upper(c)) } }
        end
    end
    
    typographies['\n'] = { control = 'linefeed', advance = 0 }

    self:mergeTypographies(typographies)
end

function WindowManager:push(...)
    local window = Window(self.font, ...)
    table.insert(self.windows, window)
    return window
end

function WindowManager:pop()
    if #self.windows > 0 then
        table.remove(self.windows)
    end
end

function WindowManager:window()
    return self.windows[#self.windows]
end

function WindowManager:update(dt)
    for _, window in ipairs(self.windows) do
        window:update(dt)
    end
end

function WindowManager:drawWindows()
    for _, window in ipairs(self.windows) do
        window:draw()
    end
end

function WindowManager:draw(...)
    local current_canvas = love.graphics.getCanvas()

    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()

    love.graphics.push()
    do
        love.graphics.origin()
        --love.graphics.translate(math.floor(self.x or 0), math.floor(self.y or 0))
        self:drawWindows()
    end
    love.graphics.pop()

    love.graphics.setCanvas(current_canvas)

    love.graphics.push()
    do
        love.graphics.origin()
        --love.graphics.scale(1, 1)
        love.graphics.setCanvas(current_canvas)
        love.graphics.draw(self.canvas)
    end
    love.graphics.pop()
end

return WindowManager