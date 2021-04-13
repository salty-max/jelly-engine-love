--[[
    KEYBOARD CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Keyboard = Class:extends('Keyboard')

function Keyboard:new()
    self.keysPressed = {}
end

function Keyboard:hookLoveEvents()
    function love.keypressed(key)
        self.keysPressed[key] = true
    end

    function love.keyreleased(key)
        self.keysPressed[key] = false
    end
end

--[[
    Returns current state of a specific key
]]
function Keyboard:key(key)
    return love.keyboard.isDown(key)
end

--[[
    Returns whether a key has been pressed THIS frame
]]
function Keyboard:keydown(key)
    return self.keysPressed[key]
end

--[[
    Returns whether a key has been released THIS frame
]]
function Keyboard:keyup(key)
    return self.keysPressed[key] == false
end

function Keyboard:update(dt)
    for k,_ in pairs(self.keysPressed) do
        self.keysPressed[k] = nil
    end
end

return Keyboard