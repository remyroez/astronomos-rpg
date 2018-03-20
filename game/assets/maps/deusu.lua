return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 30,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 8,
  properties = {
    ["background_tile"] = 2,
    ["bgm"] = "town",
    ["outer_map"] = "field",
    ["outer_map_x"] = 13,
    ["outer_map_y"] = 5
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
        16, 16, 16, 16, 16, 16, 16, 16, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 3, 4,
        16, 17, 17, 17, 17, 17, 17, 16, 11, 11, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 11, 11, 3, 4, 17, 16, 3, 3, 3, 4, 3, 3,
        16, 17, 3, 3, 3, 4, 3, 3, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 11, 11, 3, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 17, 17, 17, 17, 16, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 16, 16, 17, 17, 16, 16, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 4, 4, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 4, 4, 3, 3, 3,
        16, 16, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 4, 4, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 16, 4, 4, 4, 4, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 4, 3, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 3, 3, 3, 4, 4, 11, 11, 3, 3, 11, 11, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 3, 4, 4, 11, 11, 16, 16, 17, 17, 16, 16, 16, 16, 17, 17, 16, 16, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 4, 4, 3, 4, 4, 4, 11, 11, 16, 17, 17, 17, 17, 16, 17, 17, 17, 17, 17, 16, 4, 3, 17, 16, 3, 3, 3, 3, 3, 4,
        16, 17, 4, 4, 4, 4, 4, 4, 11, 11, 16, 17, 17, 17, 17, 16, 17, 17, 17, 17, 17, 16, 4, 3, 17, 16, 3, 3, 3, 3, 4, 3,
        16, 17, 4, 4, 4, 4, 4, 3, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 4, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 4, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 3, 3, 3, 3, 3, 3, 11, 11, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 17, 17, 17, 17, 17, 17, 16, 11, 11, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 3, 3, 3, 3, 3, 3,
        16, 16, 16, 16, 16, 16, 16, 16, 11, 11, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 3, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4
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
        256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 256, 256, 256, 256, 0, 0, 256, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0,
        256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "female-1",
          type = "npc",
          shape = "rectangle",
          x = 288,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/female-1",
            ["sprite"] = "female",
            ["telepathy"] = "deusu/female-1/telepathy"
          }
        },
        {
          id = 2,
          name = "female-2",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/female-2",
            ["sprite"] = "female",
            ["telepathy"] = "deusu/female-2/telepathy"
          }
        },
        {
          id = 3,
          name = "oldman-1",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/oldman-1",
            ["sprite"] = "oldman",
            ["telepathy"] = "deusu/oldman-1/telepathy"
          }
        },
        {
          id = 4,
          name = "oldman-2",
          type = "npc",
          shape = "rectangle",
          x = 320,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/oldman-2",
            ["sprite"] = "oldman",
            ["telepathy"] = "deusu/oldman-2/telepathy"
          }
        },
        {
          id = 5,
          name = "oldman-3",
          type = "npc",
          shape = "rectangle",
          x = 448,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/oldman-3",
            ["sprite"] = "oldman",
            ["telepathy"] = "deusu/oldman-3/telepathy"
          }
        },
        {
          id = 6,
          name = "keyman-1",
          type = "npc",
          shape = "rectangle",
          x = 192,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/keyman-1",
            ["sprite"] = "male",
            ["telepathy"] = "deusu/keyman-1/telepathy"
          }
        },
        {
          id = 7,
          name = "shop-1",
          type = "npc",
          shape = "rectangle",
          x = 208,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "deusu/shop-1",
            ["sprite"] = "shop",
            ["telepathy"] = "deusu/shop-1/telepathy"
          }
        }
      }
    }
  }
}
