--[[
    SCENE MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local SceneManager = Class:extends('SceneManager')

function SceneManager:new(sceneDir, scenes)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }

    assert(type(scenes) == 'table', "SceneManager:new -> parameter scenes must be a table")
    self.scenes = {}
    self.sceneDir = sceneDir or ""

    self.previous = self.empty
    self.current = self.empty

    for i = 1, #scenes do
        local scene = require(sceneDir .. '.' .. scenes[i])
        self.scenes[scenes[i]] = scene
    end
end

function SceneManager:add(sceneId, scene)
    self.scenes[sceneId] = scene
end

function SceneManager:remove(sceneID)
    self.scenes[sceneID] = nil
end

function SceneManager:list()

end

function SceneManager:change(sceneID, params)
    assert(self.scenes[sceneID], string.format('SceneManager:change -> scene "%s" does not exist', sceneID))
    self.current:exit()
    self.previous = self.current
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