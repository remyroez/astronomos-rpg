local class = require 'middleclass'
local SpriteManager = class("SpriteManager")

local anim8 = require 'anim8'

local Sprite = require 'Sprite'
local SpriteInstance = require 'SpriteInstance'

function SpriteManager:initialize(image, sprite_width, sprite_height, width, height)
    self.image = image
    self.grid = anim8.newGrid(sprite_width, sprite_height, self.image:getDimensions())
    self.sprite_num_x = math.floor(self.image:getWidth() / sprite_width)
    self.sprite_num_y = math.floor(self.image:getHeight() / sprite_height)

    self.x = 0
    self.y = 0
    self.width = width or -1
    self.height = height or -1

    self.sprites = {}
    self.spriteInstances = {}

    self.batch = love.graphics.newSpriteBatch(self.image)
end

function SpriteManager:newSprite(name)
    local sprite
    if self.sprites[name] then
        sprite = self.sprites[name]
    else
        sprite = Sprite()
        self.sprites[name] = sprite
    end
    return sprite
end

function SpriteManager:newSpriteAnimation(name, anim_name, speed, ...)
    if not self.sprites[name] then
        -- no sprite
    else
        self.sprites[name]:newAnimation(anim_name, self.grid(...), speed)
    end
end

function SpriteManager:newSpriteInstance(name, x,y, r, sx, sy, ox, oy, kx, ky)
    local instance
    if not self.sprites[name] then
        instance = nil
    else
        instance = SpriteInstance(self.sprites[name]:clone(), self.batch, x,y, r, sx, sy, ox, oy, kx, ky)
        self.spriteInstances[#self.spriteInstances + 1] = instance
    end
    return instance
end

function SpriteManager:clearSpriteInstances()
    self.batch:clear()
    self.spriteInstances = {}
end

function SpriteManager:updateSpriteBatch()
    for _, instance in ipairs(self.spriteInstances) do
        instance:updateSpriteBatch()
    end
end

function SpriteManager:resize(width, height)
    self.width = width
    self.height = height
end

function SpriteManager:setOffset(x, y)
    self.x = x
    self.y = y
end

function SpriteManager:update(dt)
    for _, instance in ipairs(self.spriteInstances) do
        instance:update(dt)
    end
end

function SpriteManager:draw()
    love.graphics.draw(self.batch, self.x, self.y)
end

return SpriteManager