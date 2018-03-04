local class = require 'middleclass'
local WindowManager = class("WindowManager")

local BitmapFont = require 'BitmapFont'
local Window = require 'Window'

local gfx = love.graphics

function WindowManager:initialize(image, fontWidth, fontHeight, width, height)
    self.font = BitmapFont(image, fontWidth, fontHeight)
    self:resize(width, height)

    self.windows = {}

    self:setupFont()
end

function WindowManager:resize(width, height)
    self.width = width or love.graphics.getWidth()
    self.height = height or love.graphics.getHeight()
    self.canvas = love.graphics.newCanvas(self.width, self.height)
    self.canvas:setFilter("nearest", "nearest")
end

function WindowManager:setupFont(image, fontWidth, fontHeight)
    self.font:setupQuads(image, fontWidth, fontHeight)
end

function WindowManager:setupCharacters(characters)
    self.font.characters = characters
end

function WindowManager:setupAsciiCharacters(lower_case)
    lower_case = lower_case or false
    local characters = {}
    local ascii = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    for i = 1, #ascii do
        local c = string.sub(ascii, i, i)
        characters[c] = { index = string.byte(lower_case and c or string.upper(c)) }
    end
    self:setupCharacters(characters)
end

function WindowManager:push(x, y, w, h)
    local window = Window(self.font, x, y, w, h)
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