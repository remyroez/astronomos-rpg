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
  nextobjectid = 17,
  properties = {
    ["background_tile"] = 45,
    ["bgm"] = "town",
    ["outer_map"] = "arkcity",
    ["outer_map_x"] = 20,
    ["outer_map_y"] = 52
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
        92, 92, 92, 92, 92, 92, 92, 92, 45, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 43, 43, 43, 92, 45, 46, 92, 92, 92, 92, 92, 92,
        92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 92, 92, 43, 43, 43, 43, 43, 92, 43, 38, 38, 38, 40, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 43, 38, 38, 38, 43, 92, 46, 45, 92, 40, 38, 38, 43, 92,
        92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 43, 38, 38, 38, 38, 92, 92, 46, 46, 92, 92, 43, 38, 38, 38, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 92, 92, 43, 43, 40, 43, 43, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 46, 46, 46, 46, 45, 45,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 45, 46, 45, 45, 45, 45,
        45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 40, 43, 43, 92, 46, 46, 46, 45, 45, 45, 45, 45,
        46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 45, 45, 45, 45, 45,
        45, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 45, 45,
        45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 92, 43, 43, 43, 43, 43, 43, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 92, 43, 38, 38, 38, 38, 92, 46, 46, 92, 43, 38, 38, 38, 38, 43, 92, 92, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 92, 43, 38, 38, 38, 43, 92, 46, 46, 92, 40, 38, 38, 38, 38, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 40, 38, 38, 43, 92,
        92, 92, 43, 43, 43, 43, 43, 92, 46, 46, 92, 43, 38, 38, 38, 38, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 43, 38, 38, 43, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 43, 43, 43, 43, 43, 43, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 43, 43, 43, 43, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 43, 38, 38, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 43, 43, 40, 43, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 92, 92, 92, 92, 92, 92,
        46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 46, 45, 46, 46, 46, 46, 92, 40, 38, 38, 38, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 43, 43, 40, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 46, 45, 46, 46, 46, 46,
        46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 45, 46, 46, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 45, 46, 46, 46, 46, 46, 46,
        46, 46, 92, 43, 38, 38, 38, 43, 92, 92, 46, 46, 45, 45, 46, 46, 92, 92, 92, 92, 92, 92, 92, 92, 46, 46, 46, 46, 46, 46, 45, 46,
        45, 46, 92, 43, 43, 43, 43, 43, 92, 92, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256, 0,
        0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 256, 0, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "shop-1",
          type = "npc",
          shape = "rectangle",
          x = 48,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/shop-1",
            ["sprite"] = "citizen",
            ["telepathy"] = "residential_area/shop-1/telepathy"
          }
        },
        {
          id = 2,
          name = "shop-2",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/shop-2",
            ["sprite"] = "citizen",
            ["telepathy"] = "residential_area/shop-2/telepathy"
          }
        },
        {
          id = 3,
          name = "robot-1",
          type = "npc",
          shape = "rectangle",
          x = 128,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/robot-1",
            ["sprite"] = "robot",
            ["telepathy"] = "residential_area/robot-1/telepathy"
          }
        },
        {
          id = 4,
          name = "guy-1",
          type = "npc",
          shape = "rectangle",
          x = 192,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guy-1",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guy-1/telepathy"
          }
        },
        {
          id = 5,
          name = "guy-2",
          type = "npc",
          shape = "rectangle",
          x = 224,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guy-2",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guy-2/telepathy"
          }
        },
        {
          id = 6,
          name = "guard-1",
          type = "npc",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guard-1",
            ["sprite"] = "guard",
            ["telepathy"] = "residential_area/guard-1/telepathy"
          }
        },
        {
          id = 7,
          name = "guard-2",
          type = "npc",
          shape = "rectangle",
          x = 400,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guard-2",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guard-2/telepathy"
          }
        },
        {
          id = 8,
          name = "citizen-1",
          type = "npc",
          shape = "rectangle",
          x = 208,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/citizen-1",
            ["sprite"] = "citizen",
            ["telepathy"] = "residential_area/citizen-1/telepathy"
          }
        },
        {
          id = 9,
          name = "guy-3",
          type = "npc",
          shape = "rectangle",
          x = 320,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guy-3",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guy-3/telepathy"
          }
        },
        {
          id = 10,
          name = "guy-4",
          type = "npc",
          shape = "rectangle",
          x = 320,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guy-4",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guy-4/telepathy"
          }
        },
        {
          id = 11,
          name = "citizen-2",
          type = "npc",
          shape = "rectangle",
          x = 80,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/citizen-2",
            ["sprite"] = "citizen",
            ["telepathy"] = "residential_area/citizen-2/telepathy"
          }
        },
        {
          id = 12,
          name = "guard-3",
          type = "npc",
          shape = "rectangle",
          x = 336,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guard-3",
            ["sprite"] = "guard",
            ["telepathy"] = "residential_area/guard-3/telepathy"
          }
        },
        {
          id = 13,
          name = "guy-5",
          type = "npc",
          shape = "rectangle",
          x = 464,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/guy-5",
            ["sprite"] = "guy",
            ["telepathy"] = "residential_area/guy-5/telepathy"
          }
        },
        {
          id = 14,
          name = "keyman-1",
          type = "npc",
          shape = "rectangle",
          x = 304,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/keyman-1",
            ["sprite"] = "citizen",
            ["telepathy"] = "residential_area/keyman-1/telepathy"
          }
        },
        {
          id = 15,
          name = "keyman-2",
          type = "npc",
          shape = "rectangle",
          x = 448,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/keyman-2",
            ["sprite"] = "guard",
            ["telepathy"] = "residential_area/keyman-2/telepathy"
          }
        },
        {
          id = 16,
          name = "aine",
          type = "npc",
          shape = "rectangle",
          x = 32,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["message"] = "residential_area/aine",
            ["sprite"] = "aine",
            ["telepathy"] = "residential_area/aine/telepathy"
          }
        }
      }
    }
  }
}
