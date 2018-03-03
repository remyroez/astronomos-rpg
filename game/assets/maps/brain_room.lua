return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 14,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 2,
  properties = {
    ["background_tile"] = 41,
    ["bgm"] = "town"
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
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        44, 92, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 92, 92,
        92, 91, 90, 90, 90, 90, 91, 40, 40, 91, 90, 90, 90, 90, 91, 92,
        40, 89, 92, 92, 39, 39, 42, 42, 42, 42, 39, 39, 92, 92, 89, 40,
        40, 89, 92, 92, 39, 39, 42, 42, 42, 42, 39, 39, 92, 92, 89, 40,
        40, 89, 39, 39, 42, 42, 42, 42, 42, 42, 42, 42, 39, 39, 89, 40,
        40, 91, 39, 39, 42, 42, 42, 42, 42, 42, 42, 42, 39, 39, 91, 40,
        40, 40, 42, 42, 42, 42, 92, 92, 92, 92, 42, 42, 42, 42, 40, 40,
        40, 40, 42, 42, 42, 42, 92, 92, 92, 92, 42, 42, 42, 42, 40, 40,
        40, 91, 39, 39, 42, 42, 42, 42, 42, 42, 42, 42, 39, 39, 91, 40,
        40, 89, 39, 39, 42, 42, 42, 42, 42, 42, 42, 42, 39, 39, 89, 40,
        40, 89, 92, 92, 39, 39, 42, 42, 42, 42, 39, 39, 92, 92, 89, 40,
        40, 89, 92, 92, 39, 39, 42, 42, 42, 42, 39, 39, 92, 92, 89, 40,
        92, 91, 90, 90, 90, 90, 91, 40, 40, 91, 90, 90, 90, 90, 91, 92,
        92, 92, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 92, 92
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 16,
      height = 14,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0,
        0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0,
        0, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 0,
        0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0,
        0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0,
        0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0,
        0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0,
        0, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0,
        0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "object",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "road_to_brain_room",
          type = "transfer",
          shape = "rectangle",
          x = 0,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "road_to_brain_room",
            ["transfer_x"] = 30,
            ["transfer_y"] = 1
          }
        }
      }
    }
  }
}
