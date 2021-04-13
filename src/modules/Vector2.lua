--[[
    VECTOR2 CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Vector2 = Class:extends('Vector2')

function Vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

-- TODO: Vector enhancements

return Vector2