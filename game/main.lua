
require 'util'

local rx = require 'rx'
require 'rxlove'

local sti = require 'sti'

local cargo = require "cargo"
local assets = {}

local object = rx.BehaviorSubject.create(0, 0)

local spritesheet = require 'spritesheet'
local BgmPlayer = require 'BgmPlayer'

local chars

local baton = require 'baton'
local ofsx = 0
local ofsy = 0

local context = {}

function love.load(arg)
    assets = cargo.init("assets")

    love.graphics.clear()
    love.graphics.setColor(255, 255, 255)

    --chars = spritesheet(assets.images.spritesheet)
    --chars:newWalkAnimations(1 / 60 * 10)
    map = sti("assets/maps/deusu.lua")
    map:resize(love.graphics.getDimensions())

    context.bgmPlayer = BgmPlayer(assets.bgm)
    context.bgmPlayer:setVolume(0.1)
    if map.properties.bgm then
        context.bgmPlayer:play(map.properties.bgm)
    end

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
            map:update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            map:draw(-ofsx, -ofsy)
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
            --scheduler:update(love.update:getValue())
            --print(love.update:getValue())
        end
    )
