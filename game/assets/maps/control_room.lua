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
  nextobjectid = 4,
  properties = {
    ["background_tile"] = 92,
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
        91, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 91,
        89, 93, 93, 93, 93, 92, 92, 92, 92, 92, 92, 93, 93, 93, 93, 89,
        89, 93, 92, 92, 40, 92, 92, 92, 92, 92, 92, 40, 92, 92, 93, 89,
        89, 93, 93, 93, 93, 92, 92, 92, 92, 92, 92, 93, 93, 93, 93, 89,
        91, 90, 90, 90, 90, 90, 90, 91, 92, 90, 90, 90, 91, 90, 90, 91,
        89, 39, 39, 39, 39, 39, 39, 89, 39, 39, 39, 39, 92, 92, 92, 89,
        89, 39, 93, 40, 93, 93, 39, 89, 39, 39, 39, 39, 89, 92, 92, 89,
        89, 39, 93, 92, 92, 93, 39, 89, 39, 39, 39, 39, 91, 90, 90, 91,
        89, 39, 93, 92, 92, 93, 39, 89, 39, 39, 39, 39, 89, 92, 92, 89,
        89, 39, 93, 93, 93, 93, 39, 89, 39, 39, 39, 39, 92, 92, 92, 91,
        89, 39, 93, 92, 92, 93, 39, 89, 39, 39, 39, 39, 89, 92, 92, 89,
        89, 39, 93, 92, 92, 93, 39, 91, 90, 91, 92, 92, 91, 90, 90, 91,
        89, 39, 93, 40, 93, 93, 39, 89, 92, 89, 92, 92, 89, 92, 92, 89,
        89, 39, 39, 39, 39, 39, 39, 89, 92, 92, 92, 92, 92, 92, 44, 89,
        91, 90, 90, 90, 90, 90, 90, 91, 90, 90, 90, 90, 90, 90, 90, 91
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
        0, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0,
        256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256,
        256, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, 256,
        256, 256, 256, 256, 256, 0, 0, 0, 0, 0, 0, 256, 256, 256, 256, 256,
        0, 256, 256, 256, 256, 256, 256, 0, 0, 256, 256, 256, 0, 256, 256, 0,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256,
        256, 0, 256, 0, 256, 256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 256, 0, 256, 0, 0, 0, 0, 0, 256, 256, 0,
        256, 0, 256, 0, 0, 256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 256, 256, 256, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0,
        256, 0, 256, 0, 0, 256, 0, 256, 0, 0, 0, 0, 256, 0, 0, 256,
        256, 0, 256, 0, 0, 256, 0, 0, 256, 0, 0, 0, 0, 256, 256, 0,
        256, 0, 256, 0, 256, 256, 0, 256, 0, 256, 0, 0, 256, 0, 0, 256,
        256, 0, 0, 0, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 256,
        0, 256, 256, 256, 256, 256, 256, 0, 256, 256, 256, 256, 256, 256, 256, 0
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
          name = "underground_passage",
          type = "transfer",
          shape = "rectangle",
          x = 224,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 242,
          visible = true,
          properties = {
            ["transfer_map"] = "underground_passage",
            ["transfer_x"] = 14,
            ["transfer_y"] = 28
          }
        },
        {
          id = 2,
          name = "guy-1",
          type = "npc",
          shape = "rectangle",
          x = 32,
          y = 48,
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
          id = 3,
          name = "guy-2",
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
            ["sprite"] = "guy"
          }
        }
      }
    }
  }
}
