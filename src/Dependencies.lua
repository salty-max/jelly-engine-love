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

Class = require('src/Class')

G_Fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 4),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE)
}

G_Textures = {
    ['foxy'] = love.graphics.newImage('assets/graphics/foxy.png'),
}

G_Frames = {
    ['foxy'] = GenerateQuads(G_Textures['foxy'], TILE_SIZE, TILE_SIZE),
}