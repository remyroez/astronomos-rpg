
local const = require 'const'
local util = require 'util'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local i18n = require "i18n"

local MapCommandWindowScreen = {}

MapCommandWindowScreen.COMMAND = {
    TALK = 1,
    MEDICINE = 2,
    STRENGTH = 3,
    ESP = 4,
    DISCARD = 5,
    ITEMS = 6,
}

function MapCommandWindowScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.closing = false

        self.context = context
        self.window = 
            self.context.windowManager:push(2, 2, 12, 8, true)
                :title(i18n("command/map/title"))
                :setupChoices(3, 2)
                :print(i18n("command/map/talk"), 1, 1):toChoice(true)
                :print(i18n("command/map/medicine")):toChoice()
                :print(i18n("command/map/strength")):toChoice()
                :print(i18n("command/map/esp"), 6, 1):toChoice()
                :print(i18n("command/map/discard")):toChoice()
                :print(i18n("command/map/items")):toChoice()
    end
    
    function self:current(dt)
        if self.closing then
            ScreenManager.pop()
        elseif self.context.input:pressed(const.INPUT.DECIDE) then
            self:command(self.window.selected)
        elseif self.context.input:pressed(const.INPUT.CANCEL) then
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

    function self:command(index)
        local context = self.context

        if index == MapCommandWindowScreen.COMMAND.TALK then
            context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == MapCommandWindowScreen.COMMAND.MEDICINE then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == MapCommandWindowScreen.COMMAND.STRENGTH then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == MapCommandWindowScreen.COMMAND.ESP then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == MapCommandWindowScreen.COMMAND.DISCARD then
            --context.commandManager:talk(context, context.playerActor, 'message', true, true)
        elseif index == MapCommandWindowScreen.COMMAND.ITEMS then
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

return MapCommandWindowScreen
