
local const = require 'const'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local TalkWindowScreen = {}

function TalkWindowScreen.new()
    local self = Screen.new()

    function self:init(context, message)
        self.context = context
        self.window = self.context.windowManager:push(2, 18, 28, 10, true)
        if message then
            self.window:print(message, 1, nil, 1 / 60 * 5)
        end
    end
    
    function self:current(dt)
        if self.context.input:pressed(const.INPUT.DECIDE) then
            ScreenManager.pop()
        end
    end

    function self:close()
        self.context.windowManager:pop()
    end

    return self
end

return TalkWindowScreen
