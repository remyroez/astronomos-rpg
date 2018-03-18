
local const = require 'const'

local ScreenManager = require 'ScreenManager'
local Screen = require 'Screen'

local TalkWindowScreen = {}

function TalkWindowScreen.new()
    local self = Screen.new()

    function self:init(context, messages)
        self.context = context
        self.window = self.context.windowManager:push(2, 18, 28, 10, true)
        self.counter = 0
        self.messages = messages
        if type(self.messages) ~= 'table' then
            self.messages = { self.messages }
        end

        self.window.onComplete
            :subscribe(
                function (window)
                    if self:isLastMessage() then
                        -- no button
                    else
                        window:resetButton(1 / 60 * 10)
                        print('resetButton')
                    end
                end
            )
        
        self:printNextMessage()
    end

    function self:isLastMessage()
        return self.counter >= #self.messages
    end

    function self:getCurrentMessage()
        return self.messages[self.counter]
    end

    function self:nextMessage()
        if not self.counter or self.counter < 1 then
            self.counter = 1
        else
            self.counter = self.counter + 1
        end
        return self:getCurrentMessage()
    end
    
    function self:printMessage(message)
        self.window
            :print(message, 1, nil, 1 / 60 * 5)
            :clearButton()
    end

    function self:printNextMessage()
        self:printMessage(self:nextMessage())
    end

    function self:current(dt)
        if self.context.input:pressed(const.INPUT.DECIDE) then
            if self.window:isCompleted() then
                if self:isLastMessage() then
                    ScreenManager.pop()
                else
                    self:printNextMessage()
                end
            else
                self.window:skip()
            end
        elseif self.context.input:pressed(const.INPUT.CANCEL) then
            ScreenManager.pop()
        end
    end

    function self:close()
        self.context.windowManager:pop()
    end

    return self
end

return TalkWindowScreen
