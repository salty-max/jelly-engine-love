--[[
    START SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local StartScene = Scene:extends('StartScene')

function StartScene:update(dt)
    if KM:keydown('escape') then love.event.quit() end

    if KM:keydown('enter') or KM:keydown('return') or GPM:buttondown('start') then
        SM:change('PlayScene')
    end
end

function Scene:draw()
    love.graphics.clear(_.rgbaToLove(52, 73, 94, 255))
    love.graphics.setFont(G_Fonts['large'])
    love.graphics.printf('JELLY ENGINE', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
end

return StartScene