
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
                    self:talk('message')
                elseif self.context.input:pressed(const.INPUT.ESP) then
                    self:talk('telepathy', false)
                elseif self.context.input:pressed(const.INPUT.MENU) then
                    ScreenManager.push(const.SCREEN.WINDOW, self.context)
                    ScreenManager.push(const.SCREEN.MAP_COMMAND, self.context)
                end
            end
        end
    end

    function self:talk(property, turn)
        local context = self.context
        
        property = property or 'message'
        if type(turn) ~= 'boolean' then
            turn = true
        end

        local x, y = context.actorManager:getForwardPositionFromActor(context.playerActor)
        local npc = context.actorManager:getActorFromPixel(x, y, const.OBJECT.TYPE.NPC)

        if not npc then
            -- no npc
        elseif npc:state() ~= Actor.STATE.READY then
            -- no ready
        else
            local messages = {}
            local words = { player_name = 'みなみ' }

            if not npc.properties[property] then
                -- no property
                local message = nil
                local count = 1
                while true do
                    message = i18n(
                        self.context.mapManager.current_map_name .. '/' .. npc:getName() .. '/' .. property .. (count > 1 and ('/' .. count) or ''),
                        words
                    )
                    if not message then
                        break
                    else
                        table.insert(messages, message)
                    end
                    count = count + 1
                end
            else
                local message = i18n(npc.properties[property], words)
                if not message then
                    -- no message
                else
                    table.insert(messages, message)
                end
            end
            
            if #messages == 0 then
                -- no message
            else
                ScreenManager.push(const.SCREEN.WINDOW, self.context)
                ScreenManager.push(const.SCREEN.TALK, self.context, messages)
            end

            -- turn to player
            if turn then
                context.actorManager:setActorDirectionToActor(npc, context.playerActor)
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
