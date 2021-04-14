--[[
    START SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local StartScene = Scene:extends('StartScene')

function StartScene:new()
    self.button = Button {
        position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
        size = Vector2(128, 32),
        colors = { default = PALETTE['green'], highlighted = PALETTE['dark-green'] },
        radius = Vector2(4, 4),
        origin = 'bottomLeft'
    }
end

function StartScene:update(dt)
    if KM:keydown('escape') then love.event.quit() end

    if KM:keydown('enter') or KM:keydown('return') or GPM:buttondown(1, 'start') then
        SM:change('PlayScene')
    end
end

function Scene:draw()
    love.graphics.clear(PALETTE['dark-blue'])
    love.graphics.draw(Logo, VIRTUAL_WIDTH / 2 - Logo:getWidth() / 2, 32)
    love.graphics.setFont(G_Fonts['large'])
    love.graphics.setColor(PALETTE['blue'])
    love.graphics.printf('JELLY ENGINE', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1,1,1,1)

    self.button:draw()
end

return StartScene