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
    self.currentScene = self.empty
end

function SceneManager:change(sceneID, params)
    assert(self.scenes[sceneID], string.format('SceneManager:change -> scene "%s" does not exist', sceneID))
    self.currentScene:exit()
    self.currentScene = self.scenes[sceneID]
    self.currentScene:enter(params)
end

function SceneManager:update(dt)
    self.currentScene:update(dt)
end

function SceneManager:draw()
    self.currentScene:draw()
end

return SceneManager