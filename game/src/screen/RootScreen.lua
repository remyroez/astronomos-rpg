
local const = require 'const'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local RootScreen = {}

function RootScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.context = context

        ScreenManager.push(const.SCREEN.MAP, context)
    end

    function self:draw()
    end

    function self:update(dt)
        self.context.input:update()
    end

    return self
end

return RootScreen
