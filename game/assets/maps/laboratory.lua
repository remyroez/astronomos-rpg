return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 18,
  height = 17,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 8,
  properties = {
    ["background_tile"] = 80,
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
      width = 18,
      height = 17,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81,
        81, 73, 73, 75, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 75, 73, 73, 81,
        81, 73, 75, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 75, 73, 81,
        81, 75, 73, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 73, 75, 81,
        81, 73, 73, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 73, 73, 81,
        81, 73, 73, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 73, 73, 81,
        81, 73, 73, 81, 81, 81, 81, 73, 73, 73, 73, 81, 81, 81, 81, 73, 73, 81,
        81, 73, 75, 73, 73, 73, 73, 75, 73, 73, 75, 73, 73, 73, 73, 75, 73, 81,
        81, 75, 73, 73, 73, 73, 73, 76, 75, 75, 73, 73, 73, 73, 73, 73, 75, 81,
        81, 75, 73, 73, 73, 73, 73, 73, 75, 75, 73, 73, 73, 73, 73, 73, 75, 81,
        81, 73, 75, 73, 73, 73, 73, 75, 73, 73, 75, 73, 73, 73, 73, 75, 73, 81,
        81, 73, 73, 81, 81, 81, 81, 73, 73, 73, 73, 81, 81, 81, 81, 73, 73, 81,
        81, 73, 73, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 73, 73, 81,
        81, 75, 73, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 73, 75, 81,
        81, 73, 75, 81, 81, 81, 81, 73, 75, 75, 73, 81, 81, 81, 81, 75, 73, 81,
        81, 73, 73, 75, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 75, 73, 73, 81,
        81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 18,
      height = 17,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256,
        256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 256,
        256, 256, 0, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 0, 256, 256,
        256, 0, 0, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 256,
        256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256,
        256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256,
        256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 0, 0, 0, 0, 256, 256, 256, 256, 0, 0, 256,
        256, 0, 0, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 0, 0, 256,
        256, 256, 0, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 0, 256, 256,
        256, 0, 256, 256, 256, 256, 256, 0, 256, 256, 0, 256, 256, 256, 256, 256, 0, 256,
        256, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256
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
          name = "road_to_laboratory_4",
          type = "transfer",
          shape = "rectangle",
          x = 112,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "road_to_laboratory_4",
            ["transfer_x"] = 26,
            ["transfer_y"] = 2
          }
        },
        {
          id = 2,
          name = "skeleton-1",
          type = "npc",
          shape = "rectangle",
          x = 112,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "skeleton"
          }
        },
        {
          id = 3,
          name = "skeleton-2",
          type = "npc",
          shape = "rectangle",
          x = 160,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "skeleton"
          }
        },
        {
          id = 4,
          name = "dolphin-1",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "dolphin"
          }
        },
        {
          id = 5,
          name = "dolphin-2",
          type = "npc",
          shape = "rectangle",
          x = 64,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "dolphin"
          }
        },
        {
          id = 6,
          name = "orca-1",
          type = "npc",
          shape = "rectangle",
          x = 192,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "orca"
          }
        },
        {
          id = 7,
          name = "orca-2",
          type = "npc",
          shape = "rectangle",
          x = 192,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 241,
          visible = true,
          properties = {
            ["animation"] = "down",
            ["sprite"] = "orca"
          }
        }
      }
    }
  }
}
