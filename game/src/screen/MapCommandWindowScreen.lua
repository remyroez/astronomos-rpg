
local const = require 'const'
local util = require 'util'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local MapCommandWindowScreen = {}

function MapCommandWindowScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.context = context
        self.window = 
            self.context.windowManager:push(2, 2, 12, 8, true)
                :title("COMMAND")
                :setupChoices(3, 2)
                :print("はなす", 1, 1):toChoice(true)
                :print("くすり"):toChoice()
                :print("ちから"):toChoice()
                :print("ESP", 6, 1):toChoice()
                :print("すてる"):toChoice()
                :print("もちもの"):toChoice()
    end
    
    function self:current(dt)
        if self.context.input:pressed(const.INPUT.CANCEL) then
            ScreenManager.pop()
        elseif self.context.input:pressed(const.INPUT.RIGHT) then
            self.context.windowManager:window():selectChoice(1)
        elseif self.context.input:pressed(const.INPUT.LEFT) then
            self.context.windowManager:window():selectChoice(-1)
        elseif self.context.input:pressed(const.INPUT.DOWN) then
            self.context.windowManager:window():nextChoice(1)
        elseif self.context.input:pressed(const.INPUT.UP) then
            self.context.windowManager:window():nextChoice(-1)
        end
    end

    function self:close()
        self.context.windowManager:pop()
    end

    return self
end

return MapCommandWindowScreen
