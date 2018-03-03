
require 'util'

local rx = require 'rx'
require 'rxlove'

local cargo = require "cargo"
local assets = {}

local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'
local SpriteManager = require 'SpriteManager'
local ObjectManager = require 'ObjectManager'

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
    if context.mapManager:properties().bgm then
        context.bgmPlayer:play(context.mapManager:properties().bgm)
    end
end

function love.load(arg)
    love.graphics.setDefaultFilter("nearest", "nearest")
    local w, h = love.graphics.getDimensions()

    maid64.setup(w, h)
    resize(w, h)

    assets = cargo.init("assets")

    love.graphics.clear()
    love.graphics.setColor(255, 255, 255)

    context.bgmPlayer = BgmPlayer(assets.bgm)
    context.bgmPlayer:setVolume(0.1)

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

    context.mapManager = MapManager("assets/maps", w, h)

    context.objectManager = ObjectManager(context.mapManager, context.spriteManager)

    context.mapManager.onLoad = function (map)
        context.objectManager:clearObjects()
        context.spriteManager:clearSpriteInstances()
        collectgarbage("collect")

        if map.layers["object"] then
            local layer = map.layers["object"]
            for _, object in ipairs(layer.objects) do
                context.objectManager:newObject(object)
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
    context.minami = context.objectManager:newObject {
        type = "player",
        x = x or 0,
        y = y or 0,
        properties = {
            sprite = sprite or "minami"
        }
    }
    context.minami.onArrival
        :subscribe(
            function (x, y)
                if context.mapManager:inMapFromPixel(x, y) then
                    -- in map
                    local transfer = context.objectManager:getObjectFromPixel(x, y, "transfer")
                    if not transfer then
                        -- no transfer
                    elseif not transfer.properties["transfer_map"] then
                        -- no map
                    else
                        local properties = transfer.properties
                        load_map(
                            properties["transfer_map"],
                            properties["transfer_x"] or 0,
                            properties["transfer_y"] or 0
                        )
                    end
                elseif not context.mapManager:properties()["outer_map"] then
                    -- no map
                else
                    local properties = context.mapManager:properties()
                    load_map(
                        properties["outer_map"],
                        properties["outer_map_x"] or 0,
                        properties["outer_map_y"] or 0
                    )
                end
            end
        )
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
                        context.objectManager:walkObject(
                            context.minami,
                            direction,
                            speed,
                            context.mapManager:properties()["outer_map"],
                            context.input:down 'esp'
                        )
                    end
                end
                context.objectManager:update(dt)
                
                ofsx, ofsy = context.minami:getPosition()
            end

            local ox = -(ofsx - context.mapManager.width / 2 + w / 2)
            local oy = -(ofsy - context.mapManager.height / 2 + h / 2)
            context.mapManager:setOffset(ox, oy)
            context.mapManager:update(dt)
            context.spriteManager:setOffset(ox, oy)
            context.spriteManager:update(dt)
        end
    )

love.draw
    :subscribe(
        function ()
            maid64.start()
            context.mapManager:draw()
            context.spriteManager:draw()
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
