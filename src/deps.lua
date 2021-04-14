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
    MODULES
]]
Class = require('lib.jelly.modules.Class')
Vector2 = require('lib.jelly.modules.Vector2')
Animation = require('lib.jelly.modules.Animation')
KeyboardManager = require('lib.jelly.modules.KeyboardManager')
GamepadManager = require('lib.jelly.modules.GamepadManager')
Event = require('lib.jelly.modules.Event')

Sprite = require('lib.jelly.Sprite')

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
