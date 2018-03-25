
local class = require 'middleclass'
local SpriteSheet = class("SpriteSheet")

SpriteSheet.NUM_X = 2

SpriteSheet.ANIMATION = {
    DOWN = "down",
    LEFT = "left",
    UP = "up",
    RIGHT = "right",
    NUM = 4,
    FRAME = 2,
}
SpriteSheet.ANIMATION.TOTAL_FRAMES = SpriteSheet.ANIMATION.FRAME * SpriteSheet.ANIMATION.NUM

SpriteSheet.BASE_SPEED = (1 / 60 * 20)

function SpriteSheet:initialize(spriteManager)
    self.spriteManager = spriteManager
end

function SpriteSheet:registerSprites(settings)
    for i, sprite in pairs(settings) do
        local name = sprite.name or ("sprite-" .. tostring(i))
        local type = sprite.type or "character"
        self.spriteManager:newSprite(name)
        do
            local index = sprite.index or i
            local speed = sprite.speed or SpriteSheet.BASE_SPEED
            local x = (index % SpriteSheet.NUM_X) * SpriteSheet.ANIMATION.TOTAL_FRAMES + 1
            local y = math.floor(index / SpriteSheet.NUM_X) + 1
            self.spriteManager:newSpriteAnimation(
                name,  SpriteSheet.ANIMATION.DOWN, speed, (x) .. "-" .. (x + 1), y
            )
            self.spriteManager:newSpriteAnimation(
                name,  SpriteSheet.ANIMATION.LEFT, speed, (x + 2) .. "-" .. (x + 3), y
            )
            self.spriteManager:newSpriteAnimation(
                name,  SpriteSheet.ANIMATION.UP, speed, (x + 4) .. "-" .. (x + 5), y
            )
            self.spriteManager:newSpriteAnimation(
                name,  SpriteSheet.ANIMATION.RIGHT, speed, (x + 6) .. "-" .. (x + 7), y
            )
        end
    end
end

return SpriteSheet
