--[[
    DEPENDENCIES
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

--[[
     LIBRARIES
]]
require 'lib.jelly.dependencies'
Timer = require 'lib.knife.timer'

--[[
    MISC
]]
require 'src.constants'

--[[
    DATA DEFINITIONS
]]
require 'src.data.entity_defs'

--[[
    ASSETS
]]
G_Sounds = {
    ['jump'] = love.audio.newSource('assets/sounds/smb_jump-small.wav', 'static')
}

G_Fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE * 2)
}

G_Textures = {
    ['dude'] = love.graphics.newImage('assets/graphics/dude.png'),
}

G_Frames = {
    ['dude'] = _.generateQuads(G_Textures['dude'], TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE),
}
