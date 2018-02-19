return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 14,
  height = 14,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
  properties = {
    ["background_tile"] = 19,
    ["bgm"] = "field"
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
      width = 14,
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 14, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 20,
        20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 14,
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
      }
    }
  }
}
