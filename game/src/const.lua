
local const = {}

const.DIRECTION = {
    DOWN = "down",
    LEFT = "left",
    UP = "up",
    RIGHT = "right",
    STAY = "stay"
}

const.TILE = {
    WIDTH = 16,
    HEIGHT = 16
}

const.MAP = {
    PROPERTY = {
        BGM = "bgm",
        BGM_VOLUME = "bgm_volume",
        BACKGROUND_TILE = "background_tile",
        ENCOUNTER_TABLE = "encounter_table",
        OUTER_MAP = "outer_map",
        OUTER_MAP_X = "outer_map_x",
        OUTER_MAP_Y = "outer_map_y",
    },
    BGM_VOLUME = {
        DEFAULT = 0.1
    }
}

const.LAYER = {
    TYPE = {
        OBJECT = "object",
        TILEMAP = "tilemap",
        BACKGROUND = "background",
        COLLISION = "collision"
    },
    PROPERTY = {
    }
}

const.OBJECT = {
    TYPE = {
        NPC = "npc",
        PLAYER = "player",
        TRANSFER = "transfer",
        EVENT = "event",
        UNKNOWN = "unknown"
    },
    PROPERTY = {
        SPRITE = "sprite",
        ANIMATION = "animation",
        WALK_TYPE = "walk_type",
        WALK_DURATION = "walk_duration",
        TRANSFER_MAP = "transfer_map",
        TRANSFER_X = "transfer_x",
        TRANSFER_Y = "transfer_y",
    },
    WALK_TYPE = {
        RANDOM_WALK = "random_walk"
    },
    WALK_DURATION = {
        DEFAULT = (1 / 60 * 20 * 10)
    }
}

const.OBJECT.WALK_TYPE.DEFAULT = const.OBJECT.WALK_TYPE.RANDOM_WALK

return const