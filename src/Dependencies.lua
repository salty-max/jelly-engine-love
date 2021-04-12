--[[
    DEPENDENCIES
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

require 'src/constants'
require 'src/Util'

Push = require 'lib/push'
Timer = require 'lib/knife/timer'
Event = require 'lib/knife/event'

G_Fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE * 2)
}

G_Textures = {
    ['mario'] = love.graphics.newImage('assets/graphics/mario.png'),
    ['tiles'] = love.graphics.newImage('assets/graphics/tileset.png'),
}

G_Frames = {
    ['mario'] = GenerateQuads(G_Textures['mario'], TILE_SIZE, TILE_SIZE),
    ['tiles'] = GenerateQuads(G_Textures['tiles'], TILE_SIZE, TILE_SIZE),
}