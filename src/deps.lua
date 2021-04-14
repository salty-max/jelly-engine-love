--[[
    DEPENDENCIES
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

require 'lib.jelly.Dependencies'

--[[
    MISC
]]
require 'src.constants'

--[[
    DATA DEFINITIONS
]]
require 'src.data.entity_defs'

--[[
     LIBRARIES
]]
Push = require 'lib.push'
Timer = require 'lib.knife.timer'
-- Event = require 'lib.knife.event'

--[[
    SCENES
]]
StartScene = require('src.scenes.StartScene')
PlayScene = require('src.scenes.PlayScene')

--[[
    ASSETS
]]
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
    ['dude'] = _.generateQuads(G_Textures['dude'], TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE),
}
