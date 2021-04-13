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

Class = require('src/modules/Class')
Sprite = require('src/Sprite')
Vector2 = require('src/modules/Vector2')
Animation = require('src/modules/Animation')
G_Sounds = {
    ['jump'] = love.audio.newSource('assets/sounds/smb_jump-small.wav', 'static')
}

G_Fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 4),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE)
}

G_Textures = {
    ['dude'] = love.graphics.newImage('assets/graphics/dude.png'),
}

G_Frames = {
    ['dude'] = GenerateQuads(G_Textures['dude'], TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE),
}
