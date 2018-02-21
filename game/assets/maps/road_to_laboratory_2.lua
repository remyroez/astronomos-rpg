return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 30,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
  properties = {
    ["background_tile"] = 83,
    ["bgm"] = "space",
    ["encounter_table"] = 2
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
      width = 16,
      height = 30,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84,
        84, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 84,
        84, 70, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 70, 84,
        84, 70, 84, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 84, 70, 84,
        84, 70, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 70, 84, 70, 84,
        84, 70, 70, 70, 70, 70, 70, 70, 70, 84, 84, 84, 70, 84, 70, 84,
        84, 84, 84, 84, 84, 84, 84, 84, 70, 84, 84, 84, 70, 84, 70, 84,
        84, 70, 70, 70, 70, 70, 87, 84, 70, 70, 70, 84, 70, 84, 70, 84,
        84, 70, 84, 84, 84, 84, 84, 84, 84, 84, 70, 84, 70, 84, 70, 84,
        84, 70, 84, 70, 70, 70, 70, 70, 70, 70, 70, 84, 66, 84, 70, 84,
        84, 70, 84, 70, 70, 70, 70, 84, 84, 84, 84, 84, 66, 84, 70, 84,
        84, 70, 84, 82, 82, 82, 82, 84, 70, 70, 70, 84, 82, 84, 70, 84,
        84, 70, 84, 82, 82, 82, 82, 84, 70, 84, 70, 84, 82, 84, 70, 84,
        84, 70, 84, 82, 82, 82, 82, 84, 70, 84, 70, 84, 82, 84, 70, 84,
        84, 70, 84, 82, 82, 82, 82, 84, 70, 84, 70, 84, 82, 84, 70, 84,
        84, 70, 84, 84, 66, 84, 66, 84, 70, 84, 82, 84, 82, 84, 82, 84,
        84, 70, 84, 84, 66, 84, 66, 84, 70, 84, 82, 84, 70, 84, 82, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 82, 84, 70, 84, 82, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 82, 84, 70, 84, 82, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 82, 84, 82, 84, 82, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 82, 84, 82, 84, 82, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 70, 84, 70, 84, 70, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 70, 84, 70, 84, 70, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 70, 70, 70, 70, 70, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 70, 84, 70, 70, 70, 70, 70, 84,
        84, 70, 84, 84, 70, 84, 70, 84, 84, 84, 84, 84, 84, 84, 70, 84,
        84, 70, 84, 84, 70, 84, 70, 70, 70, 70, 70, 70, 70, 84, 70, 84,
        84, 70, 84, 84, 70, 84, 84, 84, 84, 84, 84, 84, 84, 84, 70, 84,
        84, 70, 70, 70, 70, 84, 84, 84, 84, 84, 87, 70, 70, 70, 70, 84,
        84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 16,
      height = 30,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 256, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 0, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 0, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 0, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 0, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256,
        256, 0, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
      }
    }
  }
}
