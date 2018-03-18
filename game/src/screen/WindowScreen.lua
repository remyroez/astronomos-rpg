
local const = require 'const'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local WindowScreen = {}

function WindowScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.context = context
    end
    
    function self:draw()
        self.context.windowManager:draw()
    end

    function self:update(dt)
        self.context.windowManager:update(dt)
    end

    function self:current(dt)
        if ScreenManager.peek() == self then
            ScreenManager.pop()
        end
    end

    function self:receive(event)
        if event == 'close_window' then
            self:closeWindow()
        end
    end

    function self:closeWindow()
        while ScreenManager.peek() ~= self do
            ScreenManager.pop()
        end
        ScreenManager.pop()
    end

    return self
end

return WindowScreen
