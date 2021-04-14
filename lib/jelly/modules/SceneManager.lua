--[[
    SCENE MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local empty = {
    render = function() end,
    update = function() end,
    enter = function() end,
    exit = function() end
}

local SceneManager = Class:extends('SceneManager')

function SceneManager:new(sceneDir, scenes)
    

    assert(type(sceneDir) == 'string', "SceneManager:new -> parameter sceneDir must be a string")
    assert(type(scenes) == 'table', "SceneManager:new -> parameter scenes must be a table")
    self.scenes = {}
    self.sceneDir = sceneDir or ""

    self.previous = empty
    self.current = empty

    for i = 1, #scenes do
        local scene = require(self.sceneDir .. '.' .. scenes[i])
        assert(scene:is(Scene), string.format('SceneManager:new -> file %s.lua is not of type Scene', scenes[i]))
        self.scenes[scenes[i]] = scene
    end
end

function SceneManager:add(scene)
    assert(type(scene) == 'string', 'Scene:add -> parameter scene must be a string')
    self.scenes[scene] = require(self.sceneDir .. '.' .. scene)
end

function SceneManager:remove(scene)
    assert(self.scenes[scene], string.format('SceneManager:remove -> scene "%s" does not exist', scene))
    self.scenes[scene] = nil
end

function SceneManager:list()
    local sceneNames
    for k,v in pairs(self.scenes) do
        sceneNames[#sceneNames+1] = k
    end

    return sceneNames
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