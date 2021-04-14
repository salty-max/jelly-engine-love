--[[
    SCENE MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local SceneManager = Class:extends('SceneManager')

function SceneManager:new(scenes)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    self.scenes = scenes or {}
    self.current = self.empty
end

function SceneManager:change(sceneID, params)
    assert(self.scenes[sceneID], string.format('SceneManager:change -> scene "%s" does not exist', sceneID))
    self.current:exit()
    self.current = self.scenes[sceneID]()
    self.current:enter(params)
end

function SceneManager:update(dt)
    self.current:update(dt)
end

function SceneManager:draw()
    self.current:draw()
end

return SceneManager