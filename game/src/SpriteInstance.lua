local class = require 'middleclass'
local Sprite = class("Sprite")
local SpriteInstance = class("SpriteInstance", Sprite)

function SpriteInstance:initialize(sprite, batch, x,y, r, sx, sy, ox, oy, kx, ky)
    Sprite.initialize(self)
    self.animations = sprite.animations

    self.current_animation = nil

    self.x = x or 0
    self.y = y or 0
    self.r = r or nil
    self.sx = sx or nil
    self.sy = sy or nil
    self.ox = ox or nil
    self.oy = oy or nil
    self.kx = kx or nil
    self.ky = ky or nil

    self.batch = batch

    self.id = nil
end

function SpriteInstance:clone()
    local sprite = Sprite.clone(self)
    
    sprite.x = self.x or 0
    sprite.y = self.y or 0
    sprite.r = self.r or nil
    sprite.sx = self.sx or nil
    sprite.sy = self.sy or nil
    sprite.ox = self.ox or nil
    sprite.oy = self.oy or nil
    sprite.kx = self.kx or nil
    sprite.ky = self.ky or nil

    sprite.batch = self.batch

    return sprite
end

function SpriteInstance:getCurrentFrameInfo()
    if not self.current_animation then
        return nil
    else
        return self.current_animation:getFrameInfo(
            math.ceil(self.x),
            math.ceil(self.y), 
            self.r, 
            self.sx, 
            self.sy, 
            self.ox, 
            self.oy, 
            self.kx, 
            self.ky
        )
    end
end

function SpriteInstance:updateSpriteBatch()
    if not self.id then
        self.id = self.batch:add(self:getCurrentFrameInfo())
    else
        self.batch:set(self.id, self:getCurrentFrameInfo())
    end
end

function SpriteInstance:resetSpriteBatch()
    self.id = nil
    self:updateSpriteBatch()
end

function SpriteInstance:set(name)
    if not self.animations[name] then
        self.current_animation = nil
    elseif self.current_animation == self.animations[name] then
        -- current animation
    else
        self.current_animation = self.animations[name]
        self:gotoFrame(1)
        self:updateSpriteBatch()
    end
end

function SpriteInstance:getCurrentAnimationName()
    local name = nil
    for key, animation in pairs(self.animations) do
        if animation == self.current_animation then
            name = key
            break
        end
    end
    return name
end

function SpriteInstance:gotoFrame(frame)
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:gotoFrame(frame)
    end
end

function SpriteInstance:pause()
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:pause()
    end
end

function SpriteInstance:pauseAtEnd()
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:pauseAtEnd()
    end
end

function SpriteInstance:pauseAtStart()
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:pauseAtStart()
    end
end

function SpriteInstance:resume()
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:resume()
    end
end

function SpriteInstance:flipH()
    return self.current_animation and self.current_animation:flipH() or nil
end

function SpriteInstance:flipV()
    return self.current_animation and self.current_animation:flipV() or nil
end

function SpriteInstance:update(dt)
    local updated = false
    if not self.current_animation then
        -- no animation
    else
        local pos = self.current_animation.position
        self.current_animation:update(dt)
        updated = pos ~= self.current_animation.position
        if updated then
            self:updateSpriteBatch()
        end
    end
    return updated
end

function SpriteInstance:getFrameInfo(x,y, r, sx, sy, ox, oy, kx, ky)
    return self.current_animation and self.current_animation:getFrameInfo(x,y, r, sx, sy, ox, oy, kx, ky) or nil
end

function SpriteInstance:draw(x,y, angle, sx, sy, ox, oy, kx, ky)
    if not self.current_animation then
        -- no animation
    else
        self.current_animation:draw(x,y, angle, sx, sy, ox, oy, kx, ky)
    end
end

function SpriteInstance:getDimensions()
    if not self.current_animation then
        -- no animation
        return 0, 0
    else
        return self.current_animation:getDimensions()
    end
end

function SpriteInstance:getWidth()
    local value, _ = self:getDimensions()
    return value
end

function SpriteInstance:getHeight()
    local _, value = self:getDimensions()
    return value
end

return SpriteInstance