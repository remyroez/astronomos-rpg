local class = require 'middleclass'
local ActorManager = class("ActorManager")

local rx = require 'rx'

local const = require 'const'

local Actor = require "Actor"
local SpriteSheet = require "SpriteSheet"

ActorManager.SUBSCRIPTION = {
    TWEEN = "tween",
    WALK = "walk"
}

ActorManager.DEFAULT_SPRITE = "minami"
ActorManager.DEFAULT_ANIMATION = "down"
ActorManager.DEFAULT_WALK_TYPE = const.OBJECT.WALK_TYPE.DEFAULT
ActorManager.DEFAULT_WALK_DURATION = (1 / 60 * 20 * 10)

ActorManager.DEFAULT_RANDOM_WALK_SPEED = 1 / 60 * 10

local function isTweenableType(type)
    local result = false

    if type == const.OBJECT.TYPE.NPC then
        result = true
    elseif type == const.OBJECT.TYPE.PLAYER then
        result = true
    elseif type == const.OBJECT.TYPE.TRANSFER then
        result = false
    else
        result = false
    end

    return result
end

function ActorManager:initialize(mapManager, spriteManager)
    self.mapManager = mapManager
    self.spriteManager = spriteManager
    self.actors = {}

    self.random_walk_table = {
        const.DIRECTION.RIGHT,
        const.DIRECTION.LEFT,
        const.DIRECTION.DOWN,
        const.DIRECTION.UP,
        const.DIRECTION.STAY,
        const.DIRECTION.STAY
    }
    self.random_walk_speed = ActorManager.DEFAULT_RANDOM_WALK_SPEED
end

function ActorManager:newActor(object)
    local actor = Actor(object)
    local properties = object.properties
    local hasTween = false
    if actor.type == const.OBJECT.TYPE.NPC then
        actor.sprite = self.spriteManager:newSpriteInstance(
            properties[const.OBJECT.PROPERTY.SPRITE] or ActorManager.DEFAULT_SPRITE
        )
        actor:setAnimation(
            properties[const.OBJECT.PROPERTY.ANIMATION] or ActorManager.DEFAULT_ANIMATION
        )
        actor:setPosition(self.mapManager:convertPixelToPixel(object.x, object.y - actor:getHeight()))
        self:subscribeWalk(
            actor,
            properties[const.OBJECT.PROPERTY.WALK_TYPE] or const.OBJECT.WALK_TYPE.DEFAULT,
            properties[const.OBJECT.PROPERTY.WALK_DURATION] or const.OBJECT.WALK_DURATION.DEFAULT
        )
        hasTween = true
    elseif actor.type == const.OBJECT.TYPE.PLAYER then
        actor.sprite = self.spriteManager:newSpriteInstance(
            properties[const.OBJECT.PROPERTY.SPRITE] or ActorManager.DEFAULT_SPRITE
        )
        actor:setAnimation(
            properties[const.OBJECT.PROPERTY.ANIMATION] or ActorManager.DEFAULT_ANIMATION
        )
        actor:setPosition(self.mapManager:convertPixelToPixel(object.x, object.y))
        hasTween = true
    elseif actor.type == const.OBJECT.TYPE.TRANSFER then
        -- transfer
        actor:setPosition(self.mapManager:convertPixelToPixel(object.x, object.y - object.height))
    else
        print("ActorManager:newActor", "unknown type")
    end

    if hasTween then
        actor:registerSubscription(
            ActorManager.SUBSCRIPTION.TWEEN,
            actor.update
                :filter(function (dt) return actor.tween end)
                :subscribe(
                    function (self, dt)
                        if self.tween:update(dt) then
                            -- complete
                            self.tween = nil
                            self.target = nil
                            self.resetDelta()
                            self.onArrival(self:getPosition())
                        end
                        if self.sprite then
                            self.sprite:updateSpriteBatch()
                            self.x, self.y = self.sprite.x, self.sprite.y
                        end
                    end
                )
        )
    end

    table.insert(self.actors, actor)

    return actor
end

function ActorManager:clearActors()
    for _, actor in ipairs(self.actors) do
        actor:finalize()
    end

    self.actors = {}
end

function ActorManager:subscribeWalk(actor, walk_type, walk_duration)
    local subscription = nil

    if walk_type == const.OBJECT.WALK_TYPE.RANDOM_WALK then
        subscription = actor.waitStream
            :filter(function (time) return time > walk_duration end)
            :subscribe(
                function (...)
                    self:walkActor(
                        actor,
                        self.random_walk_table[math.random(#self.random_walk_table)],
                        self.random_walk_speed
                    )
                    actor.resetDelta()
                end
            )
    end

    if not subscription then
        -- no subscription
    else
        actor:registerSubscription(ActorManager.SUBSCRIPTION.WALK, subscription)
    end
end

function ActorManager:walkActor(actor, direction, speed, can_move_out, through)
    if direction == const.DIRECTION.STAY then
        return
    end
    can_move_out = can_move_out or false
    local x, y = actor:getPosition()
    local tilewidth, tileheight = self.mapManager:getTileDimensions()
    if direction == const.DIRECTION.RIGHT then
        x = x + tilewidth
    elseif direction == const.DIRECTION.LEFT then
        x = x - tilewidth
    elseif direction == const.DIRECTION.DOWN then
        y = y + tileheight
    elseif direction == const.DIRECTION.UP then
        y = y - tileheight
    end
    self:setActorDirection(actor, direction)
    if not can_move_out and not self.mapManager:inMapFromPixel(x, y) then
        -- can not move out
    elseif through or self:canPassThrough(x, y) then
        actor:move(x, y, speed or 1)
    end
end

function ActorManager:setActorDirection(actor, direction)
    if actor.type == const.OBJECT.TYPE.NPC or actor.type == const.OBJECT.TYPE.PLAYER then
        if not direction then
            -- no direction
        elseif direction == const.DIRECTION.DOWN then
            actor:setAnimation(SpriteSheet.ANIMATION.DOWN)
        elseif direction == const.DIRECTION.LEFT then
            actor:setAnimation(SpriteSheet.ANIMATION.LEFT)
        elseif direction == const.DIRECTION.UP then
            actor:setAnimation(SpriteSheet.ANIMATION.UP)
        elseif direction == const.DIRECTION.RIGHT then
            actor:setAnimation(SpriteSheet.ANIMATION.RIGHT)
        else
            -- invalid direction
        end
    end
end

function ActorManager:canPassThrough(x, y)
    local result = true
    if not self.mapManager:canPassThrough(x, y) then
        -- can not pass through
        result = false
    elseif self:getActorFromPixel(x, y, const.OBJECT.TYPE.NPC) then
        -- actor
        result = false
    end
    return result
end

function ActorManager:getActorFromPixel(x, y, type)
    local result = nil

    for _, actor in ipairs(self.actors) do
        if not actor:inObject(x, y) then
            -- position not match
        elseif type and type ~= actor.type then
            -- type not match
        else
            result = actor
            break
        end
    end

    return result
end

function ActorManager:getActorFromTile(x, y, type)
    x, y = self.mapManager:convertTileToPixel(x, y)
    return self:getActorFromTile(x, y, type)
end

function ActorManager:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end
end

return ActorManager
