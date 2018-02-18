
local class = require 'middleclass'
local spritesheet = class("spritesheet")
local anim8 = require 'anim8'

local _sprite_width = 16
local _sprite_height = 16
local _sprite_horizintal_nums = 2
local _sprite_vertical_nums = 16
local _sprite_nums = _sprite_horizintal_nums * _sprite_vertical_nums

function spritesheet:initialize(image)
    self.image = image
    self.spriteBatch = love.graphics.newSpriteBatch(self.image)
    self.animations = {}
    self.grid = anim8.newGrid(_sprite_width, _sprite_height, self.image:getDimensions())
end

function spritesheet:newAnimation(index, name, x, y, speed)
    if self.animations[index] == nil then
        self.animations[index] = {}
    end
    self.animations[index][name] = anim8.newAnimation(self.grid((x) .. "-" .. (x + 1), y), speed)
    --print("index = " .. index .. ", x = " .. x .. "-" .. (x + 1) .. ", y = ".. y)
end

function spritesheet:newWalkAnimation(index, speed)
    local x = (index % 2) * 8 + 1
    local y = math.floor(index / 2) + 1
    --print("index = " .. index .. ", x = " .. x .. ", y = " .. y)
    self:newAnimation(index,  "down", x    , y, speed)
    self:newAnimation(index,  "left", x + 2, y, speed)
    self:newAnimation(index,    "up", x + 4, y, speed)
    self:newAnimation(index, "right", x + 6, y, speed)
end

function spritesheet:newWalkAnimations(speed)
    for i in range(0, _sprite_nums - 1, 1) do
        self:newWalkAnimation(i, speed)
    end
end


function spritesheet:update(dt)
    for k, anims in pairs(self.animations) do
        --print("key = " .. k .. ", anims = " .. tostring(anims))
        for k, anim in pairs(anims) do
            --print("  key = " .. k .. ", anim = " .. tostring(anim))
            anim:update(dt)
        end
    end
end

function spritesheet:draw(index, name, x,y, angle, sx, sy, ox, oy, kx, ky)
    --print(self.animations[index])
    --print(self.animations[index][name])
    --print("index = " .. index .. ", name = " .. name .. ", table = " .. self.animations)
    if not self.animations[index] then
        -- invalid index!
    elseif not self.animations[index][name] then
        -- invalid name!
    else
        self.animations[index][name]:draw(self.image, x,y, angle, sx, sy, ox, oy, kx, ky)
    end
end

return spritesheet
