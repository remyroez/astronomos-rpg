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
  nextobjectid = 20,
  properties = {
    ["background_tile"] = 45,
    ["bgm"] = "town",
    ["outer_map"] = "arkcity",
    ["outer_map_x"] = 34,
    ["outer_map_y"] = 55
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
        92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 45, 46, 45, 45, 2, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46,
        92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 45, 45, 45, 46, 2, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45,
        92, 48, 48, 92, 92, 43, 43, 43, 43, 43, 92, 92, 45, 45, 46, 46, 2, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46,
        92, 48, 48, 92, 92, 43, 38, 38, 38, 43, 92, 92, 46, 45, 46, 46, 2, 46, 92, 43, 43, 43, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46,
        92, 92, 92, 92, 92, 43, 38, 38, 38, 38, 92, 92, 46, 46, 46, 2, 2, 46, 92, 43, 44, 38, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46,
        92, 92, 92, 92, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 46, 2, 46, 46, 92, 43, 38, 38, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46,
        92, 92, 92, 92, 92, 43, 43, 43, 43, 43, 92, 92, 45, 46, 46, 2, 46, 46, 92, 43, 43, 40, 43, 92, 92, 43, 43, 43, 43, 92, 46, 46,
        92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 2, 46, 46, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 43, 92, 45, 46,
        92, 43, 43, 43, 43, 43, 92, 92, 92, 92, 92, 92, 46, 46, 46, 2, 46, 46, 46, 46, 46, 46, 46, 46, 92, 43, 38, 38, 43, 92, 46, 46,
        92, 43, 38, 38, 38, 43, 92, 92, 48, 48, 92, 92, 46, 45, 46, 2, 46, 46, 46, 46, 45, 46, 46, 46, 92, 43, 38, 38, 43, 92, 46, 46,
        92, 43, 38, 38, 38, 38, 92, 92, 48, 48, 92, 92, 46, 46, 46, 2, 46, 46, 46, 46, 46, 46, 45, 46, 92, 43, 40, 43, 43, 92, 46, 46,
        92, 43, 38, 38, 38, 43, 92, 92, 92, 92, 46, 46, 46, 46, 2, 2, 46, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 46, 46,
        92, 43, 38, 38, 38, 43, 92, 92, 92, 92, 46, 45, 46, 46, 2, 46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46,
        92, 43, 43, 43, 43, 43, 92, 92, 92, 92, 45, 46, 46, 46, 2, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46,
        92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 2, 2, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 39, 39, 39, 39, 39, 39, 39, 39, 46, 46, 46, 2, 2, 46, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
        46, 46, 39, 39, 39, 39, 39, 39, 39, 39, 46, 46, 46, 2, 2, 46, 48, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 48,
        46, 46, 39, 39, 43, 43, 40, 43, 43, 39, 46, 45, 46, 2, 46, 46, 48, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 48,
        46, 46, 39, 39, 43, 39, 39, 39, 43, 39, 46, 46, 46, 2, 46, 46, 48, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 48,
        46, 46, 39, 39, 43, 44, 39, 39, 43, 39, 46, 46, 46, 2, 2, 46, 48, 39, 39, 39, 2, 2, 2, 2, 2, 2, 2, 2, 39, 39, 39, 48,
        46, 46, 39, 39, 43, 43, 43, 43, 43, 39, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 2, 46, 46, 2, 2, 2, 2, 39, 39, 39, 48,
        46, 46, 39, 39, 39, 39, 39, 39, 39, 39, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 2, 46, 45, 46, 46, 2, 2, 39, 39, 39, 48,
        45, 46, 39, 39, 39, 39, 39, 39, 39, 39, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 46, 46, 46, 46, 46, 46, 2, 39, 39, 39, 48,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 46, 45, 46, 44, 92, 45, 2, 39, 39, 39, 48,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 46, 2, 46, 48, 39, 39, 39, 2, 2, 45, 46, 92, 92, 46, 2, 39, 39, 39, 48,
        46, 46, 46, 46, 45, 45, 46, 46, 46, 46, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 2, 46, 45, 46, 46, 2, 2, 39, 39, 39, 48,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 45, 46, 46, 46, 2, 46, 48, 39, 39, 39, 2, 2, 2, 2, 2, 2, 2, 2, 39, 39, 39, 48,
        46, 46, 46, 46, 46, 46, 45, 45, 46, 46, 46, 46, 46, 46, 2, 46, 48, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 48,
        46, 45, 46, 46, 46, 46, 46, 45, 45, 46, 46, 46, 45, 46, 2, 46, 48, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 48,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 2, 46, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 256, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 256, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 256, 0, 256, 0, 0, 256, 256, 256, 256, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 256, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0,
        0, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 256, 0, 0, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 256, 256, 0, 256, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 256, 0, 0, 0, 0, 256, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 256, 0, 0, 0, 0, 256, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
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
          name = "shoper",
          type = "npc",
          shape = "rectangle",
          x = 112,
          y = 80,
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
          name = "informer",
          type = "npc",
          shape = "rectangle",
          x = 48,
          y = 192,
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
          id = 9,
          name = "katsuma",
          type = "npc",
          shape = "rectangle",
          x = 16,
          y = 272,
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
          id = 11,
          name = "robot",
          type = "npc",
          shape = "rectangle",
          x = 176,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "robot"
          }
        },
        {
          id = 12,
          name = "thief_1",
          type = "npc",
          shape = "rectangle",
          x = 176,
          y = 336,
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
          id = 13,
          name = "kinoshita",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "guy"
          }
        },
        {
          id = 14,
          name = "thief_2",
          type = "npc",
          shape = "rectangle",
          x = 384,
          y = 64,
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
          id = 15,
          name = "keyman",
          type = "npc",
          shape = "rectangle",
          x = 272,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "guy"
          }
        },
        {
          id = 16,
          name = "institute",
          type = "transfer",
          shape = "rectangle",
          x = 80,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "institute",
            ["transfer_x"] = 1,
            ["transfer_y"] = 7
          }
        },
        {
          id = 18,
          name = "hospital",
          type = "transfer",
          shape = "rectangle",
          x = 320,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "hospital",
            ["transfer_x"] = 8,
            ["transfer_y"] = 8
          }
        },
        {
          id = 19,
          name = "security_room",
          type = "transfer",
          shape = "rectangle",
          x = 384,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "security_room",
            ["transfer_x"] = 8,
            ["transfer_y"] = 8
          }
        }
      }
    }
  }
}
