--[[
    UTILITY FUNCTIONS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

function DisplayFPS()
    love.graphics.setFont(G_Fonts['small'])
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. love.timer.getFPS(), 8, VIRTUAL_HEIGHT - 24)
    love.graphics.setColor(1, 1, 1, 1)
end