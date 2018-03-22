return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 15,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 7,
  properties = {
    ["background_tile"] = 40,
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
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41,
        41, 38, 38, 38, 38, 38, 44, 38, 38, 38, 41, 41, 38, 38, 38, 41,
        41, 38, 38, 38, 38, 38, 41, 38, 38, 38, 41, 41, 38, 38, 38, 41,
        41, 38, 38, 38, 38, 38, 41, 38, 38, 38, 41, 41, 38, 38, 38, 41,
        41, 41, 44, 41, 41, 38, 41, 41, 41, 41, 41, 41, 41, 41, 44, 41,
        41, 38, 38, 38, 41, 39, 39, 39, 39, 39, 39, 39, 41, 39, 39, 41,
        41, 38, 38, 38, 41, 39, 41, 41, 41, 41, 41, 39, 41, 39, 39, 41,
        41, 41, 41, 41, 41, 39, 41, 38, 38, 38, 41, 39, 41, 39, 39, 41,
        41, 41, 41, 41, 41, 39, 40, 38, 44, 38, 41, 39, 39, 39, 39, 41,
        41, 38, 38, 38, 41, 39, 41, 38, 38, 38, 41, 39, 41, 39, 39, 41,
        41, 38, 38, 38, 41, 39, 41, 41, 41, 41, 41, 39, 41, 38, 38, 41,
        41, 41, 44, 41, 41, 39, 39, 39, 39, 39, 39, 39, 41, 38, 38, 41,
        41, 38, 38, 38, 41, 41, 41, 41, 41, 39, 41, 41, 41, 38, 38, 41,
        41, 38, 38, 38, 39, 39, 39, 39, 39, 39, 39, 39, 38, 38, 38, 41,
        41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41
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
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 256, 0, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 256, 0, 0, 0, 256,
        256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 0, 0, 256, 0, 256, 256, 256, 256, 256, 0, 256, 0, 0, 256,
        256, 256, 256, 256, 256, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256,
        256, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 256,
        256, 0, 0, 0, 256, 0, 256, 256, 256, 256, 256, 0, 256, 0, 0, 256,
        256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 256, 256, 0, 0, 256,
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
          name = "administrative_area",
          type = "transfer",
          shape = "rectangle",
          x = 128,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "administrative_area",
            ["transfer_x"] = 24,
            ["transfer_y"] = 23
          }
        },
        {
          id = 2,
          name = "guard-1",
          type = "npc",
          shape = "rectangle",
          x = 224,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "guard"
          }
        },
        {
          id = 3,
          name = "citizen-1",
          type = "npc",
          shape = "rectangle",
          x = 32,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "citizen"
          }
        },
        {
          id = 4,
          name = "citizen-2",
          type = "npc",
          shape = "rectangle",
          x = 32,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "citizen"
          }
        },
        {
          id = 5,
          name = "citizen-3",
          type = "npc",
          shape = "rectangle",
          x = 128,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "citizen"
          }
        },
        {
          id = 6,
          name = "misa",
          type = "npc",
          shape = "rectangle",
          x = 208,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "misa"
          }
        }
      }
    }
  }
}
