
local const = require 'const'
local util = require 'util'

local i18n = require "i18n"

local Actor = require 'Actor'
local ScreenManager = require 'ScreenManager'

local Screen = require 'Screen'

local MapScreen = {}

function MapScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.context = context
    end

    function self:draw()
        self.context.mapManager:draw()
        self.context.spriteManager:draw()
    end

    function self:current(dt)
        local context = self.context

        if context.playerActor then
            if context.playerActor:state() == Actor.STATE.READY then
                local direction = util.toDirection(context.input:get(const.INPUT.MOVE))

                if direction then
                    local speed = 1 / 60 * 20
                    if context.input:down(const.INPUT.CANCEL) then
                        speed = speed / 2
                    end
                    context.actorManager:walkActor(
                        context.playerActor,
                        direction,
                        speed,
                        context.mapManager:properties()[const.MAP.PROPERTY.OUTER_MAP],
                        context.input:down(const.INPUT.ESP)
                    )
                elseif self.context.input:pressed(const.INPUT.DECIDE) then
                    ScreenManager.push(const.SCREEN.WINDOW, self.context)
                    ScreenManager.push(const.SCREEN.TALK, self.context, i18n('mamusu/oldman-1'))
                elseif self.context.input:pressed(const.INPUT.MENU) then
                    ScreenManager.push(const.SCREEN.WINDOW, self.context)
                    ScreenManager.push(const.SCREEN.MAP_COMMAND, self.context)
                end
            end
        end
    end

    function self:update(dt)
        if ScreenManager.peek() ~= self then
            -- not active
        else
            self.context.actorManager:update(dt)
            
            if self.context.playerActor then
                local ofsx, ofsy = self.context.playerActor:getPosition()
                local w, h = self.context.mapManager:getTileDimensions()
                local ox = -(ofsx - self.context.mapManager.width / 2 + w / 2)
                local oy = -(ofsy - self.context.mapManager.height / 2 + h / 2)
                self.context.mapManager:setOffset(ox, oy)
                self.context.spriteManager:setOffset(ox, oy)
            end
            
            self.context.mapManager:update(dt)
            self.context.spriteManager:update(dt)
        end
    end

    return self
end

return MapScreen
