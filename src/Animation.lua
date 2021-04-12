--[[
    ANIMATION CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Animation = Class:extends('Animation')

function Animation:new(data)
    self.name = data.name
    self.texture = data.texture
    self.frames = data.frames
    self.fps = data.fps
    self.looping = data.looping or false

    self.timer = 1 / self.fps
    self.currentFrame = 1
    self.timesPlayed = 0
end

function Animation:refresh()
    self.timer = 1 / self.fps
    self.currentFrame = 1
end

function Animation:update(dt)
    -- if animation doesn't loop and has already played once
    if not self.looping and self.timesPlayed > 0 then return end

    -- no need to update if only one frame
    if #self.frames > 1 then
        self.timer = self.timer - dt

        if self.timer <= 0 then
            self.timer = self.timer % 1 / self.fps
            self.currentFrame = math.max(1, (self.currentFrame + 1) % (#self.frames + 1))

            -- if animation played at least once, record it
            if self.currentFrame == 1 then
                self.timesPlayed = self.timesPlayed + 1
            end
        end
    end
end

function Animation:getCurrentFrame()
    return self.frames[self.currentFrame]
end

return Animation