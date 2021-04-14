--[[
    START SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local StartScene = Scene:extends('StartScene')

function StartScene:new()
    self.KM = KeyboardManager()
end

function StartScene:update(dt)
    if self.KM:keydown('escape') then love.event.quit() end

    self.KM:update(dt)
end

function Scene:draw()
    love.graphics.clear(_.rgbaToLove(52, 73, 94, 255))
    love.graphics.setFont(G_Fonts['large'])
    love.graphics.printf('JELLY ENGINE', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
end

return StartScene