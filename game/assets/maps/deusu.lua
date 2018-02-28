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
    ["background_tile"] = 2,
    ["bgm"] = "town",
    ["outer_map"] = "field",
    ["outer_map_x"] = 13,
    ["outer_map_y"] = 5
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
        16, 16, 16, 16, 16, 16, 16, 16, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 3, 4,
        16, 17, 17, 17, 17, 17, 17, 16, 11, 11, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 11, 11, 3, 4, 17, 16, 3, 3, 3, 4, 3, 3,
        16, 17, 3, 3, 3, 4, 3, 3, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 11, 11, 3, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 16, 17, 17, 16, 16, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 4, 4, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 4, 4, 3, 3, 3,
        16, 16, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 16, 4, 4, 4, 4, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 4, 3, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 3, 3, 3, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 4, 4, 11, 11, 16, 16, 17, 17, 16, 16, 16, 16, 17, 17, 16, 16, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 4, 4, 4, 11, 11, 16, 17, 17, 17, 17, 16, 17, 17, 17, 17, 17, 16, 4, 3, 17, 16, 3, 3, 3, 3, 3, 4,
        16, 17, 4, 4, 4, 4, 4, 4, 11, 11, 16, 17, 17, 17, 17, 16, 17, 17, 17, 17, 17, 16, 4, 3, 17, 16, 3, 3, 3, 3, 4, 3,
        16, 17, 4, 4, 4, 4, 4, 3, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 4, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 17, 17, 17, 17, 17, 16, 11, 11, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 16, 16, 16, 16, 16, 16, 16, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4
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
        256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 256, 256, 256, 0, 0, 256, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
