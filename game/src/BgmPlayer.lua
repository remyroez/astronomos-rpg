local class = require 'middleclass'
local BgmPlayer = class("BgmPlayer")

function BgmPlayer:initialize(sources)
    self.sources = sources or {}
    self.current_source = nil
    self.volume = 1.0
end

function BgmPlayer:setCurrentSource(name)
    if not self.sources[name] then
        -- invalid name
        self:stop()
        self.current_source = nil
    elseif self.sources[name] == self.current_source then
        -- equal current source
    else
        self:stop()
        self.current_source = self.sources[name]
        self.current_source:setLooping(true)
        self:setVolume(self.volume)
    end
end

function BgmPlayer:play(name)
    if not name then
        -- play()
        if not self.current_source then
            -- invalid source
        else
            self.current_source:play()     
        end
    else
        -- play(name)
        self:setCurrentSource(name)
        self:play()
    end
end

function BgmPlayer:stop()
    if not self.current_source then
        -- don't played
    else
        self.current_source:stop()
    end
end

function BgmPlayer:pause()
    if not self.current_source then
        -- don't played
    else
        self.current_source:pause()
    end
end

function BgmPlayer:resume()
    if not self.current_source then
        -- don't played
    else
        self.current_source:resume()
    end
end

function BgmPlayer:rewind()
    if not self.current_source then
        -- don't played
    else
        self.current_source:rewind()
    end
end

function BgmPlayer:setVolume(volume)
    self.volume = volume
    if not self.current_source then
        -- don't played
    else
        self.current_source:setVolume(self.volume)
    end
end

function BgmPlayer:isPlaying()
    return self.current_source and self.current_source:isPlaying() or false
end

function BgmPlayer:isStopped()
    return self.current_source and self.current_source:isStopped() or false
end

function BgmPlayer:isPaused()
    return self.current_source and self.current_source:isPaused() or false
end

function BgmPlayer:state()
    local state = "unknown"
    if self:isPlaying() then
        state = "playing"
    elseif self:isStopped() then
        state = "stopped"
    elseif self:isPaused() then
        state = "paused"
    end
    return state
end

return BgmPlayer
