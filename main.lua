--[[
    MAIN PROGRAM
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

-- enable console output
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src.deps'



function love.load()
    _Game = Game {
        scenes = { 'StartScene', 'PlayScene' }
    }

    _Game:init()

    _Game.sceneManager:change('StartScene')
end


function love.update(dt)
    _Game:update(dt)
end

function love.draw()
    _Game:draw()
end