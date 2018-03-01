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
  nextobjectid = 3,
  properties = {
    ["background_tile"] = 2,
    ["bgm"] = "town",
    ["outer_map"] = "field",
    ["outer_map_x"] = 10,
    ["outer_map_y"] = 20
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
        16, 16, 16, 16, 16, 16, 3, 3, 3, 4, 4, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 9, 9, 4, 4,
        16, 17, 17, 17, 17, 16, 4, 4, 4, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 4, 4, 2, 3, 3, 3, 3, 3, 9, 9, 4, 4,
        16, 17, 17, 17, 17, 17, 11, 11, 11, 11, 11, 11, 11, 11, 3, 3, 3, 3, 3, 3, 4, 2, 2, 4, 4, 3, 3, 3, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 11, 11, 11, 11, 11, 11, 11, 11, 3, 3, 3, 3, 3, 3, 3, 2, 4, 4, 4, 4, 3, 3, 9, 9, 3, 3,
        16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 4, 4, 11, 11, 3, 3, 3, 3, 3, 3, 3, 2, 7, 7, 7, 7, 7, 7, 9, 9, 3, 3,
        16, 16, 16, 16, 16, 16, 4, 4, 3, 3, 4, 4, 11, 11, 3, 3, 3, 3, 3, 4, 3, 2, 7, 7, 10, 10, 7, 7, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 4, 2, 7, 10, 10, 8, 10, 7, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 17, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 2, 2, 7, 7, 10, 7, 10, 7, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 4, 11, 11, 11, 16, 16, 17, 17, 16, 16, 3, 3, 4, 4, 2, 2, 7, 7, 7, 7, 7, 7, 9, 9, 3, 3,
        16, 16, 16, 16, 16, 16, 11, 11, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 4, 4, 2, 3, 7, 7, 7, 7, 7, 7, 9, 9, 3, 3,
        4, 4, 3, 3, 3, 3, 4, 11, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 4, 4, 2, 3, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        3, 3, 4, 3, 3, 3, 4, 4, 11, 11, 16, 16, 16, 16, 16, 16, 12, 12, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 3, 3, 3, 3, 3, 3, 12, 12, 3, 2, 12, 12, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 3, 3, 3, 3, 3, 3, 12, 12, 2, 2, 12, 12, 12, 12, 3, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 12, 12, 12, 12, 2, 2, 12, 12, 12, 12, 4, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 12, 12, 6, 12, 2, 4, 12, 12, 4, 3, 4, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 12, 12, 12, 12, 2, 4, 12, 12, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 12, 12, 12, 12, 2, 4, 12, 12, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 3, 3, 3, 4, 4, 11, 11, 3, 3, 3, 3, 12, 12, 12, 12, 2, 4, 12, 12, 3, 3, 4, 3, 3, 3, 9, 9, 3, 3,
        4, 4, 4, 3, 3, 3, 4, 4, 11, 11, 3, 3, 4, 3, 3, 3, 12, 12, 2, 2, 12, 12, 3, 3, 3, 4, 3, 3, 9, 9, 3, 3,
        4, 4, 3, 3, 3, 3, 3, 3, 11, 11, 3, 4, 3, 3, 3, 3, 12, 12, 2, 2, 12, 12, 3, 3, 3, 4, 3, 3, 9, 9, 3, 3,
        16, 16, 16, 16, 16, 16, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 3, 4, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 3, 4, 4, 2, 4, 4, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 4, 4, 4, 4, 11, 11, 3, 4, 4, 2, 4, 3, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3,
        16, 17, 17, 17, 17, 16, 3, 3, 3, 4, 4, 4, 4, 4, 11, 11, 3, 3, 4, 2, 3, 3, 3, 3, 3, 3, 4, 3, 9, 9, 3, 3,
        16, 16, 17, 16, 16, 16, 16, 16, 16, 16, 16, 16, 4, 4, 11, 11, 3, 3, 4, 2, 3, 3, 3, 3, 3, 3, 3, 4, 9, 9, 4, 3,
        16, 16, 17, 16, 16, 16, 16, 17, 17, 17, 17, 16, 3, 3, 11, 11, 11, 11, 2, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 3, 3, 11, 11, 11, 11, 2, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 9, 9, 3, 3,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 9, 9, 3, 3
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
        256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 256, 0, 256, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 0, 256, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 256, 0, 0, 256, 256, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "arkcity",
          type = "transfer",
          shape = "rectangle",
          x = 400,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "arkcity",
            ["transfer_x"] = 41,
            ["transfer_y"] = 21
          }
        },
        {
          id = 2,
          name = "space_tower",
          type = "transfer",
          shape = "rectangle",
          x = 256,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "space_tower",
            ["transfer_x"] = 44,
            ["transfer_y"] = 4
          }
        }
      }
    }
  }
}
