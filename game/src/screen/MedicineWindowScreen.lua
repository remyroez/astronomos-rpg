
local const = require 'const'
local util = require 'util'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local i18n = require "i18n"

local MedicineWindowScreen = {}

function MedicineWindowScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.closing = false

        self.context = context
        self.window = 
            self.context.windowManager:push(15, 4, 12, 26, true)
                :print(i18n("command/map/medicine/select"), 1, 1)

        for i = 1, 10 do
            self.window:print("DUMMY " .. i, nil, (i == 1) and 4 or nil):toChoice(i == 1)
        end
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

        context.commandManager:openTalkWindow(context, "USE ITEM " .. index)
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

return MedicineWindowScreen
