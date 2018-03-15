
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
    end

    return self
end

return WindowScreen
