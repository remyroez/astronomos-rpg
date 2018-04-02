
local const = require 'const'
local util = require 'util'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local i18n = require "i18n"

local EspCommandWindowScreen = {}

EspCommandWindowScreen.COMMAND = {
    BREAK = 1,
    JUMP = 2,
    TELEPATHY = 3,
    SAVE = 4,
}

function EspCommandWindowScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.closing = false

        self.context = context
        self.window = 
            self.context.windowManager:push(2, 4, 8, 10, true)
                :title(i18n("command/map/esp/title"))
                :setupChoices(4)
                :print(i18n("command/map/esp/break"), 1, 1):toChoice(true)
                :print(i18n("command/map/esp/jump")):toChoice()
                :print(i18n("command/map/esp/telepathy")):toChoice()
                :print(i18n("command/map/esp/save")):toChoice()
    end
    
    function self:current(dt)
        if self.closing then
            ScreenManager.pop()
        elseif self.context.input:pressed(const.INPUT.DECIDE) then
            self:command(self.window.selected)
        elseif self.context.input:pressed(const.INPUT.CANCEL) then
            ScreenManager.pop()
        elseif self.context.input:pressed(const.INPUT.DOWN) then
            self.context.windowManager:window():nextChoice(1)
        elseif self.context.input:pressed(const.INPUT.UP) then
            self.context.windowManager:window():nextChoice(-1)
        end
    end

    function self:command(index)
        local context = self.context

        if index == EspCommandWindowScreen.COMMAND.BREAK then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == EspCommandWindowScreen.COMMAND.JUMP then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == EspCommandWindowScreen.COMMAND.TELEPATHY then
            context.commandManager:talk(context, context.playerActor, 'telepathy', false, true)
        elseif index == EspCommandWindowScreen.COMMAND.SAVE then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        else
            -- no command
        end
    end

    function self:receive(event)
        if event == 'close_window' then
            self.closing = true
        end
    end

    function self:close()
        self.context.windowManager:pop()
    end

    return self
end

return EspCommandWindowScreen
