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
  nextobjectid = 3,
  properties = {
    ["background_tile"] = 84,
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
      width = 32,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85, 85, 85, 70, 83, 83, 66, 66, 66, 70, 85, 70, 70, 70, 70, 70, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 85, 85, 70, 85, 70, 88, 70, 85, 85, 85, 70, 85, 85, 85, 85, 85, 70, 85, 70, 88, 70, 85, 85, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 85, 85, 70, 85, 70, 70, 70, 85, 85, 85, 70, 85, 85, 85, 85, 85, 70, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 83, 83, 83, 83, 83, 66, 66, 66, 70, 70, 70, 70, 70, 70, 85, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 85, 85, 70, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 85, 85, 70, 70, 70, 70, 70, 70, 83, 83, 83, 83, 83, 66, 66, 66, 70, 70, 70, 70, 70, 70, 70, 70, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 70, 85, 70, 70, 70, 70, 70, 83, 83, 83, 83, 83, 66, 66, 66, 70, 70, 70, 70, 70, 70, 70, 85, 70, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 70, 85, 85, 85, 70, 85, 70, 85, 70, 70, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 83, 83, 83, 83, 83, 66, 66, 66, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85,
        85, 85, 85, 85, 85, 70, 85, 70, 85, 70, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 70, 85,
        85, 85, 85, 85, 85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 83, 83, 83, 83, 83, 66, 66, 66, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85,
        85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85
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
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 256, 256, 0, 256, 0, 0, 0, 256, 256, 256, 0, 256, 256, 256, 256, 256, 0, 256, 0, 0, 0, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 256, 256, 0, 256, 0, 0, 0, 256, 256, 256, 0, 256, 256, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 0, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 256, 256, 256, 256, 0, 256, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
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
          name = "road_to_laboratory_3",
          type = "transfer",
          shape = "rectangle",
          x = 192,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "road_to_laboratory_3",
            ["transfer_x"] = 22,
            ["transfer_y"] = 3
          }
        },
        {
          id = 2,
          name = "laboratory",
          type = "transfer",
          shape = "rectangle",
          x = 416,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "laboratory",
            ["transfer_x"] = 7,
            ["transfer_y"] = 8
          }
        }
      }
    }
  }
}
