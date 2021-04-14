--[[
    MOUSE MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local MouseManager = Class:extends('MouseManager')

local function hookLoveEvents(self)
    function love.mousepressed(x, y, button)
        self.buttonsClicked[button] = true
    end

    function love.mousereleased(x, y, button)
        self.buttonsClicked[button] = false
    end
end

function MouseManager:new()
    self.buttonsClicked = {}

    hookLoveEvents(self)
end

--[[
    Returns current state of a specific button
]]
function MouseManager:button(button)
    return love.mouse.isDown(button)
end

--[[
    Returns whether a button has been pressed THIS frame
]]
function MouseManager:buttondown(button)
    return self.buttonsClicked[button]
end

--[[
    Returns whether a button has been released THIS frame
]]
function MouseManager:buttonup(button)
    return self.buttonsClicked[button] == false
end

function MouseManager:getPos()
    return Vector2(love.mouse.getX(), love.mouse.getY())
end

function MouseManager:update(dt)
    for k,_ in pairs(self.buttonsClicked) do
        self.buttonsClicked[k] = nil
    end
end

return MouseManager