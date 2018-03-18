
local const = require 'const'

local util = {}

function util.range(from, to, step)
    step = step or 1
    return function(_, lastvalue)
        local nextvalue = lastvalue + step
        if step > 0 and nextvalue <= to or step < 0 and nextvalue >= to or
            step == 0
        then
            return nextvalue
        end
    end, nil, from - step
end

function util.shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function util.toDirection(x, y)
    local direction = const.DIRECTION.DOWN

    if x > 0 then
        direction = const.DIRECTION.RIGHT
    elseif x < 0 then
        direction = const.DIRECTION.LEFT
    elseif y > 0 then
        direction = const.DIRECTION.DOWN
    elseif y < 0 then
        direction = const.DIRECTION.UP
    else
        direction = nil
    end

    return direction
end

return util
