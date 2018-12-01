local class = require 'middleclass'
local CommandManager = class("CommandManager")

local const = require 'const'
local util = require 'util'

local i18n = require "i18n"

local ScreenManager = require 'ScreenManager'

function CommandManager:initialize(actorManager, mapManager)
    self.actorManager = actorManager
    self.mapManager = mapManager
end

function CommandManager:talk(context, playerActor, property, turn, nomessage)
    if not context then
        return
    elseif not playerActor then
        return
    end

    property = property or 'message'
    if type(turn) ~= 'boolean' then turn = true end
    if type(nomessage) ~= 'boolean' then nomessage = false end

    local x, y = self.actorManager:getForwardPositionFromActor(playerActor)
    local npc = self.actorManager:getActorFromPixel(x, y, const.OBJECT.TYPE.NPC)

    local messages = {}
    local words = { player_name = 'みなみ' }

    if not npc then
        -- no npc
        if nomessage then table.insert(messages, i18n("command/map/talk/no-npc")) end
    elseif not npc:isReady() then
        -- no ready
        if nomessage then table.insert(messages, i18n("command/map/talk/no-npc")) end
    elseif not npc.properties[property] then
        -- no property
        local message = nil
        local count = 1
        while true do
            message = i18n(
                self.mapManager.current_map_name .. '/' .. npc:getName() .. '/' .. property .. (count > 1 and ('/' .. count) or ''),
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
        self:openTalkWindow(context, messages)
    end

    -- turn to player
    if npc and turn then
        self.actorManager:setActorDirectionToActor(npc, playerActor)
    end
end

function CommandManager:openTalkWindow(context, messages)
    ScreenManager.push(const.SCREEN.WINDOW, context)
    ScreenManager.push(const.SCREEN.TALK, context, messages, true)
end

function CommandManager:openMapCommandWindow(...)
    ScreenManager.push(const.SCREEN.WINDOW, ...)
    ScreenManager.push(const.SCREEN.MAP_COMMAND, ...)
end

function CommandManager:openEspCommandWindow(...)
    ScreenManager.push(const.SCREEN.ESP, ...)
end

function CommandManager:openMedicineWindow(...)
    ScreenManager.push(const.SCREEN.MEDICINE, ...)
end

function CommandManager:openStrengthWindow(...)
    --ScreenManager.push(const.SCREEN.STATUS, ...)
end

function CommandManager:openDiscardWindow(...)
    --ScreenManager.push(const.SCREEN.DISPOSE, ...)
end

function CommandManager:openItemsWindow(...)
    --ScreenManager.push(const.SCREEN.BELONGINGS, ...)
end

function CommandManager:openItemWindow(...)
    --ScreenManager.push(const.SCREEN.ITEMS, ...)
end

function CommandManager:openIngredientWindow(...)
    --ScreenManager.push(const.SCREEN.MATERIALS, ...)
end


return CommandManager
