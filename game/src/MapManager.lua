local class = require 'middleclass'
local MapManager = class("MapManager")

local sti = require 'sti'

function MapManager:initialize(basepath, width, height)
    self.basepath = basepath
    --self.files = files
    self.maps = {}
    self.current_map = nil
    self.width = width or 800
    self.height = height or 600
    self.x = 0
    self.y = 0
end

function MapManager:load(name)
    if self.maps[name] then
        -- map loaded
    else
        local map = sti(self.basepath .. "/" .. name .. ".lua")
        print(map)
        map:resize(love.graphics.getDimensions())
        self.maps[name] = map
    end
end

function MapManager:setMap(name)
    if not name then
        -- invalid name
        self.current_map = nil
    elseif not self.maps[name] then
        -- map not loaded
        self:load(name)
        self.current_map = self.maps[name]
    elseif self.maps[name] == self.current_map then
        -- equal current map
    else
        self.current_map = self.maps[name]
    end
end

function MapManager:setOffset(x, y)
    self.x = x
    self.y = y
end

function MapManager:properties()
    return self.current_map and self.current_map.properties or {}
end

function MapManager:update(dt)
    if not self.current_map then
        -- invalid map
    else
        self.current_map:update(dt)
    end
end

function MapManager:draw()
    if not self.current_map then
        -- invalid map
    else
        self.current_map:draw(self.x, self.y)
    end
end

return MapManager