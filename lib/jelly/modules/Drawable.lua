--[[
    UI COMPONENT CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Drawable = Class:extends('Drawable')

function Drawable:setOrigin(origin)
    assert(type(origin) == 'string', "Drawable:setOrigin -> parameter origin must be a string")

    if origin == 'topLeft' then
        self.origin = Vector2(0, 0)
    elseif origin == 'topRight' then
        self.origin = Vector2(self.size.x, 0)
    elseif origin == 'bottomLeft' then
        self.origin = Vector2(0, self.size.y)
    elseif origin == 'bottomRight' then
        self.origin = Vector2(self.size.x, self.size.y)
    elseif origin == 'center' then
        self.origin = Vector2(self.size.x / 2, self.size.y / 2)
    end
end

return Drawable