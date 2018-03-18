local class = require 'middleclass'
local MapManager = class("MapManager")

local sti = require 'sti'

local const = require 'const'
local util = require 'util'

function MapManager:initialize(basepath, width, height)
    self.basepath = basepath
    --self.files = files
    self.maps = {}
    self.current_map = nil

    self.width = width or love.graphics.getWidth()
    self.height = height or love.graphics.getHeight()
    self.x = 0
    self.y = 0

    self.onLoad = function (map) end
end

function MapManager:addBackgroundLayer(map, tile_gid)
    local layer = map:addCustomLayer(const.LAYER.TYPE.BACKGROUND, 1)
    layer.tile = map.tiles[tile_gid]
    layer.image = map.tilesets[layer.tile.tileset].image
    layer.width = math.ceil(self.width / layer.tile.width)
    layer.height = math.ceil(self.height / layer.tile.height)
    layer.batch = love.graphics.newSpriteBatch(
        layer.image,
        (layer.width + 2) * (layer.height + 2)
    )
    for i in util.range(-1, layer.height, 1) do
        for j in util.range(-1, layer.width, 1) do
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
        for name, layer in pairs(map.layers) do
            if name == const.LAYER.TYPE.COLLISION then
                layer.visible = false
            elseif name == const.LAYER.TYPE.OBJECT then
                layer.visible = false
            elseif name == const.LAYER.TYPE.TILEMAP then
                layer.visible = true
            else
                layer.visible = false
            end
        end
        if map.properties[const.MAP.PROPERTY.BACKGROUND_TILE] then
            self:addBackgroundLayer(map, map.properties[const.MAP.PROPERTY.BACKGROUND_TILE] + 1)
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
    if self.current_map and self.onLoad then
        self.onLoad(self.current_map)
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

function MapManager:getMapDimensions()
    if not self.current_map then
        -- invalid map
        return 0, 0
    else
        return self.current_map.width, self.current_map.height
    end
end

function MapManager:getTileDimensions()
    if not self.current_map then
        -- invalid map
        return 0, 0
    else
        return self.current_map.tilewidth, self.current_map.tileheight
    end
end

function MapManager:convertPixelToTile(x, y)
    if not self.current_map then
        -- invalid map
        return 0, 0
    else
        return self.current_map:convertPixelToTile(x, y)
    end
end

function MapManager:convertTileToPixel(x, y)
    if not self.current_map then
        -- invalid map
        return 0, 0
    else
        return self.current_map:convertTileToPixel(x, y)
    end
end

function MapManager:convertPixelToPixel(x, y)
    return self:convertTileToPixel(self:convertPixelToTile(x, y))
end

function MapManager:getTile(layer, x, y)
    if not self.current_map then
        -- invalid map
        return nil
    elseif not self.current_map.layers[layer] then
        -- invalid layer
        return nil
    elseif not self.current_map.layers[layer].data[y + 1] then
        -- invalid y
        return nil
    else
        return self.current_map.layers[layer].data[y + 1][x + 1]
    end
end

function MapManager:getTileFromPixel(layer, x, y)
    return self:getTile(layer, self:convertPixelToTile(x, y))
end

function MapManager:canPassThrough(x, y)
    local tile = self:getTileFromPixel(const.LAYER.TYPE.COLLISION, x, y)
    if not tile then
        return true
    else
        return tile.id ~= 255
    end
end

function MapManager:inMap(x, y)
    local w, h = self:getMapDimensions()
    if x < 0 or y < 0 then
        return false
    elseif x >= w or y >= h then
        return false
    else
        return true
    end
end

function MapManager:inMapFromPixel(x, y)
    return self:inMap(self:convertPixelToTile(x, y))
end

function MapManager:properties(key)
    if not self.current_map then
        return nil
    elseif not key then
        return self.current_map.properties
    else
        return self.current_map.properties[key]
    end
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