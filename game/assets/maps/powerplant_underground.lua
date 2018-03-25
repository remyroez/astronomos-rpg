return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 12,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 4,
  properties = {
    ["background_tile"] = 19,
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
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 14, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "powerplant",
          type = "transfer",
          shape = "rectangle",
          x = 96,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "powerplant",
            ["transfer_x"] = 19,
            ["transfer_y"] = 3
          }
        },
        {
          id = 3,
          name = "siba",
          type = "npc",
          shape = "rectangle",
          x = 96,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "powerplant/siba",
            ["sprite"] = "siba"
          }
        }
      }
    }
  }
}
