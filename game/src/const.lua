
local const = {}

const.DIRECTION = {
    DOWN = "down",
    LEFT = "left",
    UP = "up",
    RIGHT = "right",
    STAY = "stay"
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