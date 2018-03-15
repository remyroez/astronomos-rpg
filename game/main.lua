
local const = require 'const'

require 'util'

local rx = require 'rx'
require 'rxlove'

local cargo = require "cargo"

local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'
local SpriteManager = require 'SpriteManager'
local SpriteSheet = require 'SpriteSheet'
local ActorManager = require 'ActorManager'
local WindowManager = require 'WindowManager'

local ScreenManager = require 'ScreenManager'

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

    local w, h = const.SCREEN.WIDTH, const.SCREEN.HEIGHT

    maid64.setup(w, h)
    resize(love.graphics.getDimensions())

    context.assets = cargo.init("assets")

    context.bgmPlayer = BgmPlayer(context.assets.bgm)
    context.bgmPlayer:setVolume(const.MAP.BGM_VOLUME.DEFAULT)

    context.spriteManager = SpriteManager(
        context.assets.images.spritesheet, 
        const.TILE.WIDTH, const.TILE.HEIGHT,
        w, h
    )
    context.spriteSheet = SpriteSheet(context.spriteManager)
    context.spriteSheet:registerSprites(context.assets.data.spritesheet)

    context.mapManager = MapManager("assets/maps", w, h)

    context.actorManager = ActorManager(context.mapManager, context.spriteManager)

    context.windowManager = WindowManager(context.assets.images.font, 8, 8, 2, w, h)
    context.windowManager:setupAsciiCharacters(" .!?:0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    context.windowManager:mergeCharacters(context.assets.data.typography)

    --[[
    context.windowManager:push(2, 18, 28, 10, true)
        :print("いろはにほへとちりぬるを　わかよたれそつねならむぺうゐのおくやまけふこえて　あさきゆめみしゑひもせす", 1, nil, 1 / 60 * 5)
        :print("がざだばぱ　わかよたれそつねならむ", 1)
        :print("うゐのおくやまけふこえて")
        :print("あさきゆめみしゑひもせす")
        :resetButton(1 / 60 * 10)
        
    context.windowManager:push(2, 2, 12, 8, true)
        :title("COMMAND")
        :setupChoices(3, 2)
        :print("はなす", 1, 1):toChoice(true)
        :print("くすり"):toChoice()
        :print("ちから"):toChoice()
        :print("ESP", 6, 1):toChoice()
        :print("すてる"):toChoice()
        :print("もちもの"):toChoice()
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
        context.playerActor = createPlayer(x, y, "minami")
        context.spriteManager:updateSpriteBatch()
    end

    context.input = baton.new {
        controls = {
            -- move
            [const.INPUT.LEFT]  = {'key:left',  --[['axis:leftx-',]] 'button:dpleft'},
            [const.INPUT.RIGHT] = {'key:right', --[['axis:leftx+',]] 'button:dpright'},
            [const.INPUT.UP]    = {'key:up',    --[['axis:lefty-',]] 'button:dpup'},
            [const.INPUT.DOWN]  = {'key:down',  --[['axis:lefty+',]] 'button:dpdown'},
            -- command
            [const.INPUT.DECIDE] = {'key:z', 'button:a'},
            [const.INPUT.CANCEL] = {'key:x', 'button:b'},
            [const.INPUT.ESP]    = {'key:c', 'button:x'},
            [const.INPUT.MENU]   = {'key:space', 'button:start'},
            -- system
            [const.INPUT.ALT] = {'key:ralt', 'key:lalt'},
        },
        pairs = {
            [const.INPUT.MOVE] = {'left', 'right', 'up', 'down'}
        },
        joystick = love.joystick.getJoysticks()[1],
    }

    ScreenManager.init(
        {
            [const.SCREEN.ROOT] = require 'screen.RootScreen',
            [const.SCREEN.MAP] = require 'screen.MapScreen',
        },
        const.SCREEN.ROOT,
        context
    )

    --load_map("administrative_area", 0, 24)
    load_map("field", 11, 20)
    --load_map("arkcity", 24, 20)
    --load_map("space_tower", 8, 3)
end

function createPlayer(x, y, sprite)
    local actor = context.actorManager:newActor {
        type = const.OBJECT.TYPE.PLAYER,
        x = x or 0,
        y = y or 0,
        properties = {
            [const.OBJECT.PROPERTY.SPRITE] = sprite or "minami"
        }
    }
    actor.onArrival
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
    return actor
end

love.update
    :subscribe(
        function (dt)
            if ScreenManager.peek() and ScreenManager.peek().current then
                ScreenManager.peek():current(dt)
            end
            ScreenManager.update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            maid64.start()
            ScreenManager.draw()
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
