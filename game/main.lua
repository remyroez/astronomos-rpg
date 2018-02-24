
require 'util'

local rx = require 'rx'
require 'rxlove'

local cargo = require "cargo"
local assets = {}

local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'
local SpriteManager = require 'SpriteManager'

local baton = require 'baton'
local ofsx = 0
local ofsy = 0

local object = rx.BehaviorSubject.create(0, 0)

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

    context.bgmPlayer = BgmPlayer(assets.bgm)
    context.bgmPlayer:setVolume(0.1)

    local w, h = love.graphics.getDimensions()

    context.mapManager = MapManager("assets/maps", w, h)

    context.spriteManager = SpriteManager(
        assets.images.spritesheet, 
        16, 16,
        w, h
    )

    setupSpriteSheet {
        { name = "minami", index = 2 },
        { name = "siba", index = 3 },
        { name = "misa", index = 4 },
        { name = "aine", index = 5 },
        { name = "shop", index = 6 },
        { name = "doctor", index = 7 },
        { name = "female", index = 8 },
        { name = "male", index = 9 },
        { name = "oldman", index = 10 },
        { name = "citizen", index = 11 },
        { name = "nurse", index = 12 },
        { name = "guy", index = 13 },
        { name = "guard", index = 14 },
        { name = "robot", index = 15 },
        { name = "astronaut", index = 16 },
        { name = "skeleton", index = 17 },
        { name = "dolphin", index = 18 },
        { name = "orca", index = 19 },
    }

    context.minami = context.spriteManager:newSpriteInstance("minami")
    context.minami:set("left")

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

function setupSpriteSheet(settings)
    for i, sprite in pairs(settings) do
        local name = sprite.name or ("sprite-" .. tostring(_))
        context.spriteManager:newSprite(name)
        do
            local index = sprite.index or i
            local speed = sprite.speed or (1 / 60 * 20)
            local x = (index % 2) * 8 + 1
            local y = math.floor(index / 2) + 1
            context.spriteManager:newSpriteAnimation(
                name,  "down", speed, (x) .. "-" .. (x + 1), y
            )
            context.spriteManager:newSpriteAnimation(
                name,  "left", speed, (x + 2) .. "-" .. (x + 3), y
            )
            context.spriteManager:newSpriteAnimation(
                name,  "up", speed, (x + 4) .. "-" .. (x + 5), y
            )
            context.spriteManager:newSpriteAnimation(
                name,  "right", speed, (x + 6) .. "-" .. (x + 7), y
            )
        end
    end
end

love.update
    :subscribe(
        function (dt)
            context.input:update()
            local x, y = context.input:get 'move'
            local anim = "down"
            if x > 0.1 or x < 0.1 or y > 0.1 or y < 0.1 then
                ofsx = ofsx + x
                ofsy = ofsy + y
                if x > 0 then
                    anim = "right"
                elseif x < 0 then
                    anim = "left"
                elseif y > 0 then
                    anim = "down"
                elseif y < 0 then
                    anim = "up"
                else
                    anim = nil
                end
            end
            context.minami.x = ofsx
            context.minami.y = ofsy
            if anim then
                context.minami:set(anim)
            end
            local w, h = context.minami:getDimensions()
            local ox = -(ofsx - context.mapManager.width / 2 + w / 2)
            local oy = -(ofsy - context.mapManager.height / 2 + h / 2)
            context.minami:updateSpriteBatch()
            context.mapManager:setOffset(ox, oy)
            context.mapManager:update(dt)
            context.spriteManager:setOffset(ox, oy)
            context.spriteManager:update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            context.mapManager:draw()
            context.spriteManager:draw()
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
        end
    )
