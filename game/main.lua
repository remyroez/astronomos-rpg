
require 'util'

local rx = require 'rx'
require 'rxlove'

local sti = require 'sti'

local cargo = require "cargo"
local assets = {}

local object = rx.BehaviorSubject.create(0, 0)

local spritesheet = require 'spritesheet'
local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'

local chars

local baton = require 'baton'
local ofsx = 0
local ofsy = 0

local context = {}

local maps = {
    "administrative_area",
    "arkcity",
    "brain_room",
    "cave",
    "cockpit",
    "control_room",
    "deusu",
    "field1",
    "hospital",
    "institute",
    "laboratory",
    "mamusu",
    "powerplant",
    "powerplant_underground",
    "residential_area",
    "road_to_arkcity",
    "road_to_arkcity_underground",
    "road_to_brain_room",
    "road_to_cockpit_1",
    "road_to_cockpit_2",
    "road_to_cockpit_3",
    "road_to_cockpit_4",
    "road_to_laboratory_1",
    "road_to_laboratory_2",
    "road_to_laboratory_3",
    "road_to_laboratory_4",
    "security_room",
    "space_tower",
    "underground_passage"
}

local map_index = 0

function next_map()
    if map_index < 1 then
        map_index = 1
    elseif map_index >= #maps then
        map_index = 1
    else
        map_index = map_index + 1
    end
    load_map(maps[map_index])
end

function load_map(path)
    context.mapManager:setMap(path)
    if context.mapManager:properties().bgm then
        context.bgmPlayer:play(context.mapManager:properties().bgm)
    end
end

function love.load(arg)
    assets = cargo.init("assets")

    love.graphics.clear()
    love.graphics.setColor(255, 255, 255)

    --chars = spritesheet(assets.images.spritesheet)
    --chars:newWalkAnimations(1 / 60 * 10)

    context.bgmPlayer = BgmPlayer(assets.bgm)
    context.bgmPlayer:setVolume(0.1)

    context.mapManager = MapManager("assets/maps", love.graphics.getDimensions())

    context.input = baton.new {
        controls = {
            -- move
             left = {'key:left', 'axis:leftx-', 'button:dpleft'},
            right = {'key:right', 'axis:leftx+', 'button:dpright'},
               up = {'key:up', 'axis:lefty-', 'button:dpup'},
             down = {'key:down', 'axis:lefty+', 'button:dpdown'},
            -- command
            decide = {'key:z', 'button:a'},
            cancel = {'key:x', 'button:b'},
               esp = {'key:c', 'button:x'},
              menu = {'key:space', 'button:start'},
        },
        pairs = {
            move = {'left', 'right', 'up', 'down'}
        },
        joystick = love.joystick.getJoysticks()[1],
    }
    next_map()
end

love.update
    :subscribe(
        function (dt)
            --chars:update(dt)
            ---[[
            context.input:update()
            local x, y = context.input:get 'move'
            if x > 0.1 or x < 0.1 or y > 0.1 or y < 0.1 then
                ofsx = ofsx + x
                ofsy = ofsy + y
                --print("x = " ..  map.offsetx .. ", y = " .. map.offsety)
            end
            --]]
            context.mapManager:setOffset(-ofsx, -ofsy)
            context.mapManager:update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            context.mapManager:draw()
            --love.graphics.print("Hello World", object:getValue())
            --chars:draw(3, 'left', object:getValue())
        end
    )

love.keypressed
    :filter(function (key) return key == 'escape' end)
    :subscribe(function () love.event.quit() end)

love.keypressed
    :filter(function (key) return key == 'f5' end)
    :subscribe(function () love.event.quit("restart") end)

love.mousemoved
    :map(
        function (x, y, dx, dy, istouched)
            return math.max(100, math.min(x, 400)), math.max(100, math.min(y, 400))
        end    
    )
    :subscribe(
        function (x, y)
            object:onNext(x, y)
        end,
        function () end,
        function ()
            print("done.")
        end
    )
    
love.mousepressed
    :filter(function (x, y, button) return button == 1 end)
    :subscribe(
        function (x, y, button)
            next_map()
            ofsx = 0
            ofsy = 0
            --scheduler:update(love.update:getValue())
            --print(love.update:getValue())
        end
    )
