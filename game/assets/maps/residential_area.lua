return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 30,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
  properties = {
    ["background_tile"] = 45,
    ["bgm"] = "town",
    ["outer_map"] = "arkcity",
    ["outer_map_x"] = 20,
    ["outer_map_y"] = 52
  },
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      filename = "../../../tiled/tileset.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../images/tileset.png",
      imagewidth = 256,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "tilemap",
      x = 0,
      y = 0,
      width = 32,
      height = 30,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        92, 92, 92, 92, 92, 92, 92, 92, 45, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 43, 43, 43, 92, 45, 46, 92, 92, 92, 92, 92, 92,
        92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 92, 92, 43, 43, 43, 43, 43, 92, 43, 38, 38, 38, 40, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 43, 38, 38, 38, 43, 92, 46, 45, 92, 40, 38, 38, 43, 92,
        92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 43, 38, 38, 38, 38, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 92, 92, 43, 43, 40, 43, 43, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 46, 46, 46, 46, 45, 45,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 45, 46, 45, 45, 45, 45,
        45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 40, 43, 43, 92, 46, 46, 46, 45, 45, 45, 45, 45,
        46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 45, 45, 45, 45, 45,
        45, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 45, 45,
        45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 92, 43, 43, 43, 43, 43, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 92, 43, 38, 38, 38, 38, 92, 46, 46, 92, 43, 38, 38, 38, 38, 43, 92, 92, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 92, 40, 38, 38, 38, 38, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 40, 38, 38, 43, 92,
        92, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 38, 38, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 43, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 40, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 46, 45, 46, 46, 46, 46, 92, 40, 38, 38, 38, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 43, 43, 40, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 46, 45, 46, 46, 46, 46,
        46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 45, 46, 46, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 45, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 45, 45, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 46, 46, 46, 45, 46,
        45, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 32,
      height = 30,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0,
        0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
