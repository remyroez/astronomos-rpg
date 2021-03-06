return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 15,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 4,
  properties = {
    ["background_tile"] = 36,
    ["bgm"] = "field",
    ["encounter_table"] = 1
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
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        35, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35,
        33, 36, 36, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 33, 36, 36, 36, 36, 36, 36, 36, 36, 36, 55, 33,
        33, 36, 35, 34, 34, 34, 34, 34, 34, 35, 34, 34, 34, 34, 34, 34, 34, 35, 36, 36, 33, 36, 36, 36, 36, 36, 33, 36, 36, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 36, 36, 36, 33, 36, 36, 36, 36, 36, 36, 36, 33, 36, 36, 33, 36, 33, 36, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 34, 34, 35, 36, 36, 33, 36, 36, 33, 36, 36, 36, 36, 33, 36, 36, 33, 36, 35, 34, 34, 34, 35, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 33, 36, 36, 33, 36, 36, 33, 36, 36, 36, 36, 33, 36, 36, 33, 36, 33, 36, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 55, 33, 36, 36, 33, 36, 36, 33, 36, 36, 36, 36, 33, 36, 36, 33, 36, 36, 36, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 35, 34, 34, 34, 35, 36, 36, 35, 36, 36, 35, 34, 34, 35, 36, 33, 36, 36, 33, 36, 36, 36, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 33, 36, 36, 33, 36, 36, 33, 36, 36, 33, 36, 33, 36, 34, 35, 34, 34, 34, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 33, 36, 36, 36, 36, 36, 36, 36, 36, 33, 36, 33, 36, 36, 36, 36, 36, 36, 36, 36, 33, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 35, 34, 34, 34, 34, 34, 34, 34, 36, 33, 36, 33, 36, 34, 34, 34, 35, 34, 34, 34, 35, 36, 33, 36, 36, 33,
        33, 36, 33, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 33, 36, 33, 54, 54, 54, 54, 33, 36, 36, 36, 36, 36, 33, 36, 36, 33,
        33, 36, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 36, 33, 54, 54, 54, 54, 36, 36, 34, 34, 34, 34, 35, 36, 36, 33,
        33, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 33, 54, 54, 54, 54, 33, 36, 36, 36, 36, 36, 36, 36, 36, 33,
        35, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 34, 34, 34, 34, 35, 34, 34, 34, 34, 34, 34, 34, 34, 35
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 32,
      height = 15,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 256, 256, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 256, 256, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 256, 0, 256, 0, 256, 256, 256, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 0, 256, 256, 256, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0
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
          x = 80,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "arkcity",
            ["transfer_x"] = 8,
            ["transfer_y"] = 29
          }
        },
        {
          id = 3,
          name = "brain_room",
          type = "transfer",
          shape = "rectangle",
          x = 480,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "brain_room",
            ["transfer_x"] = 0,
            ["transfer_y"] = 0
          }
        }
      }
    }
  }
}
