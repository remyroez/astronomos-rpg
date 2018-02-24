local class = require 'middleclass'
local MapManager = class("MapManager")

local sti = require 'sti'

function MapManager:initialize(basepath, width, height)
    self.basepath = basepath
    --self.files = files
    self.maps = {}
    self.current_map = nil

    self.width = width or love.graphics.getWidth()
    self.height = height or love.graphics.getHeight()
    self.x = 0
    self.y = 0
end

function MapManager:addBackgroundLayer(map, tile_gid)
    local layer = map:addCustomLayer("background", 1)
    layer.tile = map.tiles[tile_gid]
    layer.image = map.tilesets[layer.tile.tileset].image
    layer.width = math.ceil(self.width / layer.tile.width)
    layer.height = math.ceil(self.height / layer.tile.height)
    layer.batch = love.graphics.newSpriteBatch(
        layer.image,
        (layer.width + 2) * (layer.height + 2)
    )
    for i in range(-1, layer.height, 1) do
        for j in range(-1, layer.width, 1) do
            layer.batch:add(
                layer.tile.quad,
                layer.tile.width * j,
                layer.tile.height * i
            )
        end
    end
    layer.mapManager = self
    function layer:draw()
        love.graphics.draw(
            self.batch, 
            math.ceil(-self.mapManager.x + self.mapManager.x % 16),
            math.ceil(-self.mapManager.y + self.mapManager.y % 16)
        )
    end
end

function MapManager:load(name)
    if self.maps[name] then
        -- map loaded
    else
        local map = sti(self.basepath .. "/" .. name .. ".lua")
        map:resize(self:getDimensions())
        if map.properties.background_tile then
            self:addBackgroundLayer(map, map.properties.background_tile + 1)
        end
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

function MapManager:resize(width, height)
    self.width = width or love.graphics.getWidth()
    self.height = height or love.graphics.getHeight()
    
    if not self.current_map then
        -- invalid map
    else
        self.current_map:resize(self:getDimensions())
    end
end

function MapManager:getDimensions()
    return self.width, self.height
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