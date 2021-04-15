--[[
    KEYBOARD MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local KeyboardManager = Class:extends('KeyboardManager')

local function hookLoveEvents(self)
    function love.keypressed(key)
        self.keysPressed[key] = true
    end

    function love.keyreleased(key)
        self.keysPressed[key] = false
    end
end

function KeyboardManager:new()
    self.keysPressed = {}

    hookLoveEvents(self)
end

--[[
    Returns current state of a specific key
]]
function KeyboardManager:key(key)
    return love.keyboard.isDown(key)
end

--[[
    Returns whether a key has been pressed THIS frame
]]
function KeyboardManager:keydown(key)
    return self.keysPressed[key]
end

--[[
    Returns whether a key has been released THIS frame
]]
function KeyboardManager:keyup(key)
    return self.keysPressed[key] == false
end

function KeyboardManager:update(dt)
    for k,_ in pairs(self.keysPressed) do
        self.keysPressed[k] = nil
    end
end

return KeyboardManager