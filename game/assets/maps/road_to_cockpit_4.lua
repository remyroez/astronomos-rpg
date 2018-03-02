return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
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
      width = 16,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 88, 85,
        85, 70, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 70, 85,
        85, 70, 83, 85, 85, 70, 70, 70, 70, 70, 70, 85, 85, 83, 70, 85,
        85, 70, 83, 85, 83, 83, 83, 83, 83, 83, 83, 83, 85, 83, 70, 85,
        85, 70, 83, 70, 83, 66, 66, 66, 66, 66, 66, 83, 70, 83, 70, 85,
        85, 70, 83, 70, 83, 66, 66, 66, 66, 66, 66, 83, 70, 83, 70, 85,
        85, 70, 83, 70, 83, 66, 66, 88, 66, 66, 66, 83, 70, 83, 70, 85,
        85, 70, 83, 70, 83, 66, 66, 66, 66, 66, 66, 83, 70, 83, 70, 85,
        85, 70, 83, 70, 83, 66, 66, 66, 66, 66, 66, 83, 70, 83, 70, 85,
        85, 70, 83, 85, 83, 83, 83, 83, 83, 83, 70, 83, 85, 83, 70, 85,
        85, 70, 83, 85, 85, 70, 70, 70, 70, 70, 70, 85, 85, 83, 70, 85,
        85, 70, 83, 83, 83, 70, 83, 83, 83, 83, 83, 83, 83, 83, 70, 85,
        85, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 85,
        85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 16,
      height = 15,
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
        256, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 256,
        256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 256,
        256, 0, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
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
          name = "road_to_cockpit_3",
          type = "transfer",
          shape = "rectangle",
          x = 224,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "road_to_cockpit_3",
            ["transfer_x"] = 5,
            ["transfer_y"] = 1
          }
        },
        {
          id = 2,
          name = "cockpit",
          type = "transfer",
          shape = "rectangle",
          x = 112,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "cockpit",
            ["transfer_x"] = 2,
            ["transfer_y"] = 14
          }
        }
      }
    }
  }
}
