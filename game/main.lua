
local const = require 'const'

require 'util'

local rx = require 'rx'
require 'rxlove'

local cargo = require "cargo"
local assets = {}

local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'
local SpriteManager = require 'SpriteManager'
local SpriteSheet = require 'SpriteSheet'
local ActorManager = require 'ActorManager'
local WindowManager = require 'WindowManager'

local baton = require 'baton'
local startx = 0
local starty = 0
local ofsx = 0
local ofsy = 0

local maid64 = require 'maid64'

local context = {}

function screenshot(path)
    path = path or tostring(os.time())
    local ss = love.graphics.newScreenshot();
    ss:encode('png', path .. '.png');
end

function toggleFullscreen()
    return love.window.setFullscreen(not love.window.getFullscreen())
end

function resize(width, height)
    local w, h = love.graphics.getDimensions()
    width = math.max(maid64.sizeX, math.floor((width or w) / maid64.sizeX) * maid64.sizeX)
    height = math.max(maid64.sizeY, math.floor((height or h) / maid64.sizeY) * maid64.sizeY)
    maid64.resize(width, height)
    if maid64.overscan then
        maid64.x = (w - (maid64.scaler * maid64.sizeX)) / 2
    else
        maid64.x = w / 2 - (maid64.scaler * (maid64.sizeX / 2))
    end
    maid64.y = h / 2 - (maid64.scaler * (maid64.sizeY / 2))
end

function load_map(path, x, y)
    startx = x or 0
    starty = y or 0
    context.mapManager:setMap(path)
    if context.mapManager:properties(const.MAP.PROPERTY.BGM) then
        context.bgmPlayer:play(context.mapManager:properties(const.MAP.PROPERTY.BGM))
    end
end

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest")
    local w, h = love.graphics.getDimensions()

    maid64.setup(w, h)
    resize(w, h)

    assets = cargo.init("assets")

    context.bgmPlayer = BgmPlayer(assets.bgm)
    context.bgmPlayer:setVolume(const.MAP.BGM_VOLUME.DEFAULT)

    context.spriteManager = SpriteManager(
        assets.images.spritesheet, 
        const.TILE.WIDTH, const.TILE.HEIGHT,
        w, h
    )
    context.spriteSheet = SpriteSheet(context.spriteManager)
    context.spriteSheet:registerSprites(assets.data.spritesheet)

    context.mapManager = MapManager("assets/maps", w, h)

    context.actorManager = ActorManager(context.mapManager, context.spriteManager)

    context.windowManager = WindowManager(assets.images.font, 8, 8, 2, w, h)
    context.windowManager:setupAsciiCharacters(" .!?:0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    context.windowManager:mergeCharacters(assets.data.typography)

    context.windowManager:push(2, 18, 28, 10, true)
        :print("いろはにほへとちりぬるを　わかよたれそつねならむぺうゐのおくやまけふこえて　あさきゆめみしゑひもせす", 1, nil, 1 / 60 * 5)
        :print("がざだばぱ　わかよたれそつねならむ", 1)
        :print("うゐのおくやまけふこえて")
        :print("あさきゆめみしゑひもせす")
        :resetButton(1 / 60 * 10)
        
    context.windowManager:push(2, 2, 12, 8, true)
        :setupChoices(3, 2)
        :print("はなす", 1, 1):toChoice(true)
        :print("くすり"):toChoice()
        :print("ちから"):toChoice()
        :print("ESP", 6, 1):toChoice()
        :print("すてる"):toChoice()
        :print("もちもの"):toChoice()
    --[[
    context.windowManager:window():print("Hello,World!...力、。")
    context.windowManager:window():print("あかさたなはまやらわぁゃがざだばぱ", 0, 3)
    context.windowManager:window():print("いきしちにひみ　り　ぃ　ぎじぢびぴ", 0, 5)
    context.windowManager:window():print("うくすつぬふむゆるをぅゅぐずづぶぴ", 0, 7)
    context.windowManager:window():print("えけせてねへめ　れっぇ　げぜでべぺ", 0, 9)
    context.windowManager:window():print("おこそとのほもよろんぉょごぜどぼぽ", 0, 11)

    context.windowManager:window():print("アカサタナハマヤラワァャガザダバパ", 0, 13)
    context.windowManager:window():print("イキシチニヒミ　リ　ィ　ギジヂビピ", 0, 15)
    context.windowManager:window():print("ウクスツヌフムユルヲゥュグズヅブピ", 0, 17)
    context.windowManager:window():print("エケセテネヘメ　レッェ　ゲゼデベペ", 0, 19)
    context.windowManager:window():print("オコソトノホモヨロンォョゴゼドボポ", 0, 21)
    --]]

    context.mapManager.onLoad = function (map)
        context.actorManager:clearActors()
        context.spriteManager:clearSpriteInstances()
        collectgarbage("collect")

        if map.layers[const.LAYER.TYPE.OBJECT] then
            local layer = map.layers[const.LAYER.TYPE.OBJECT]
            for _, object in ipairs(layer.objects) do
                context.actorManager:newActor(object)
            end
        end
        local x, y = map:convertTileToPixel(startx, starty)
        createPlayer(x, y, "minami")
        context.spriteManager:updateSpriteBatch()
    end

    context.input = baton.new {
        controls = {
            -- move
             left = {'key:left',  --[['axis:leftx-',]] 'button:dpleft'},
            right = {'key:right', --[['axis:leftx+',]] 'button:dpright'},
               up = {'key:up',    --[['axis:lefty-',]] 'button:dpup'},
             down = {'key:down',  --[['axis:lefty+',]] 'button:dpdown'},
            -- command
            decide = {'key:z', 'button:a'},
            cancel = {'key:x', 'button:b'},
               esp = {'key:c', 'button:x'},
              menu = {'key:space', 'button:start'},
            -- system
            alt = {'key:ralt', 'key:lalt'},
        },
        pairs = {
            move = {'left', 'right', 'up', 'down'}
        },
        joystick = love.joystick.getJoysticks()[1],
    }
    --load_map("administrative_area", 0, 24)
    load_map("field", 11, 20)
    --load_map("arkcity", 24, 20)
    --load_map("space_tower", 8, 3)
end

function createPlayer(x, y, sprite)
    context.minami = context.actorManager:newActor {
        type = const.OBJECT.TYPE.PLAYER,
        x = x or 0,
        y = y or 0,
        properties = {
            [const.OBJECT.PROPERTY.SPRITE] = sprite or "minami"
        }
    }
    context.minami.onArrival
        :subscribe(
            function (x, y)
                if context.mapManager:inMapFromPixel(x, y) then
                    -- in map
                    local transfer = context.actorManager:getActorFromPixel(
                        x, y, const.OBJECT.TYPE.TRANSFER
                    )
                    if not transfer then
                        -- no transfer
                    elseif not transfer.properties[const.OBJECT.PROPERTY.TRANSFER_MAP] then
                        -- no map
                    else
                        local properties = transfer.properties
                        load_map(
                            properties[const.OBJECT.PROPERTY.TRANSFER_MAP],
                            properties[const.OBJECT.PROPERTY.TRANSFER_X] or 0,
                            properties[const.OBJECT.PROPERTY.TRANSFER_Y] or 0
                        )
                    end
                elseif not context.mapManager:properties(const.MAP.PROPERTY.OUTER_MAP) then
                    -- no map
                else
                    local properties = context.mapManager:properties()
                    load_map(
                        properties[const.MAP.PROPERTY.OUTER_MAP],
                        properties[const.MAP.PROPERTY.OUTER_MAP_X] or 0,
                        properties[const.MAP.PROPERTY.OUTER_MAP_Y] or 0
                    )
                end
            end
        )
end

love.update
    :subscribe(
        function (dt)
            context.input:update()
            local w, h = context.mapManager:getTileDimensions()

            if context.minami then
                if context.minami:state() == "ready" then
                    local x, y = context.input:get 'move'
                    local direction = "down"
                    if x > 0 then
                        direction = "right"
                    elseif x < 0 then
                        direction = "left"
                    elseif y > 0 then
                        direction = "down"
                    elseif y < 0 then
                        direction = "up"
                    else
                        direction = nil
                    end

                    if direction then
                        local speed = 1 / 60 * 20
                        if context.input:down 'cancel' then
                            speed = speed / 2
                        end
                        context.actorManager:walkActor(
                            context.minami,
                            direction,
                            speed,
                            context.mapManager:properties()["outer_map"],
                            context.input:down 'esp'
                        )
                    end
                end
                context.actorManager:update(dt)
                
                ofsx, ofsy = context.minami:getPosition()
            end

            local ox = -(ofsx - context.mapManager.width / 2 + w / 2)
            local oy = -(ofsy - context.mapManager.height / 2 + h / 2)
            context.mapManager:setOffset(ox, oy)
            context.mapManager:update(dt)
            context.spriteManager:setOffset(ox, oy)
            context.spriteManager:update(dt)
            context.windowManager:update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            maid64.start()
            context.mapManager:draw()
            context.spriteManager:draw()
            context.windowManager:draw()
            maid64.finish()
        end
    )

love.resize
    :subscribe(function(w, h) resize(w, h) end)
    
love.keypressed
    :filter(function (key) return context.input:down 'alt' end)
    :filter(function (key) return (key == 'return') end)
    :subscribe(function () toggleFullscreen() end)

love.keypressed
    :filter(function (key) return key == 'escape' end)
    :subscribe(function () love.event.quit() end)

love.keypressed
    :filter(function (key) return key == 'f5' end)
    :subscribe(function () love.event.quit("restart") end)

love.keypressed
    :filter(function (key) return key == 'f6' end)
    :subscribe(function () screenshot() end)

love.keypressed
    :filter(function (key) return key == 'pageup' end)
    :subscribe(function () context.windowManager:window():vscroll(-1) end)

love.keypressed
    :filter(function (key) return key == 'pagedown' end)
    :subscribe(function () context.windowManager:window():vscroll(1) end)

love.keypressed
    :filter(function (key) return key == 'home' end)
    :subscribe(function () context.windowManager:window():hscroll(-1) end)

love.keypressed
    :filter(function (key) return key == 'end' end)
    :subscribe(function () context.windowManager:window():hscroll(1) end)

love.keypressed
    :filter(function (key) return key == 'w' end)
    :subscribe(function () context.windowManager:window():nextChoice(-1) end)

love.keypressed
    :filter(function (key) return key == 's' end)
    :subscribe(function () context.windowManager:window():nextChoice(1) end)

    love.keypressed
    :filter(function (key) return key == 'a' end)
    :subscribe(function () context.windowManager:window():selectChoice(-1) end)

love.keypressed
    :filter(function (key) return key == 'd' end)
    :subscribe(function () context.windowManager:window():selectChoice(1) end)
