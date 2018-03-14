
local const = require 'const'

local cargo = require "cargo"

local BgmPlayer = require 'BgmPlayer'
local MapManager = require 'MapManager'
local SpriteManager = require 'SpriteManager'
local SpriteSheet = require 'SpriteSheet'
local ActorManager = require 'ActorManager'
local WindowManager = require 'WindowManager'

local Screen = require 'Screen'

local RootScreen = {}

function RootScreen.new()
    local self = Screen.new()

    function self:init(context)
        self.context = context
    end

    function self:draw()
    end

    function self:update(dt)
    end

    return self
end

return RootScreen
