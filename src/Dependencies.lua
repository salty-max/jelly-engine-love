--[[
    DEPENDENCIES
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

require 'src/constants'
require 'src/Util'

require 'src/data/entity_defs'

Push = require 'lib/push'
Timer = require 'lib/knife/timer'
Event = require 'lib/knife/event'

Class = require('src/Class')
Sprite = require('src/Sprite')
Vector2 = require('src/Vector2')
Animation = require('src/Animation')
G_Sounds = {
    ['jump'] = love.audio.newSource('assets/sounds/smb_jump-small.wav', 'static')
}

G_Fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 4),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE)
}

G_Textures = {
    ['mario'] = love.graphics.newImage('assets/graphics/mario.png'),
}

G_Frames = {
    ['mario'] = GenerateQuads(G_Textures['mario'], TILE_SIZE, TILE_SIZE),
}
