local class = require 'middleclass'
local ObjectManager = class("ObjectManager")

local Object = require("Object")

function ObjectManager:initialize(mapManager, spriteManager)
    self.mapManager = mapManager
    self.spriteManager = spriteManager
    self.objects = {}

    self.random_walk_table = { "right", "left", "down", "up", "stay", "stay" }
    self.random_walk_speed = 1 / 60 * 10
end

function ObjectManager:newObject(template)
    local object = Object(template.type)
    local properties = template.properties
    if object.type == "npc" then
        local sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        sprite:set(properties["animation"] or "down")
        sprite.x = template.x
        sprite.y = template.y - sprite:getHeight() -- bottom -> top
        object.sprite = sprite
        object.event = properties["walk_type"] or "random_walk"
        object.duration = properties["walk_duration"] or (1 / 60 * 20 * 10)
    elseif object.type == "player" then
        local sprite = self.spriteManager:newSpriteInstance(properties["sprite"] or "minami")
        sprite:set(properties["animation"] or "down")
        sprite.x = template.x
        sprite.y = template.y
        object.sprite = sprite
    else
        print("error")
    end
    table.insert(self.objects, object)
    return object
end

function ObjectManager:clearObjects()
    self.objects = {}
end

function ObjectManager:update(dt)
    for _, object in ipairs(self.objects) do
        local event = object:update(dt)
        if event == "random_walk" then
            local w, h = self.mapManager:getTileDimensions()
            object:walk(
                self.random_walk_table[math.random(#self.random_walk_table)],
                w, h, self.random_walk_speed
            )
        end
    end
end

return ObjectManager
