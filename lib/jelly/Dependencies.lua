_ = require 'lib.jelly.Util'

require 'lib.jelly.conf.config'

--[[
    ASSETS
]]
_G.fonts = {
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE / 2),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', TILE_SIZE * 2)
}

_G.sounds = {
    ['jump'] = love.audio.newSource('assets/sounds/smb_jump-small.wav', 'static')
}

_G.textures = {
    ['dude'] = love.graphics.newImage('assets/graphics/dude.png'),
    ['logo'] = love.graphics.newImage('lib/jelly/logo.png')
}

_G.frames = {
    ['dude'] = _.generateQuads(_G.textures['dude'], TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE),
}

--[[
    LIBRARIES
]]
Push = require 'lib.jelly.lib.push'


--[[
    MODULES
]]
Class = require 'lib.jelly.modules.Class'
Game = require 'lib.jelly.Game'
Vector2 = require 'lib.jelly.modules.Vector2'
Animation = require 'lib.jelly.modules.Animation'
KeyboardManager = require 'lib.jelly.modules.managers.KeyboardManager'
GamepadManager = require 'lib.jelly.modules.managers.GamepadManager'
MouseManager = require 'lib.jelly.modules.managers.MouseManager'
Event = require 'lib.jelly.modules.Event'
Scene = require 'lib.jelly.modules.Scene'
SceneManager = require 'lib.jelly.modules.managers.SceneManager'
Drawable = require 'lib.jelly.modules.Drawable'

Sprite = require 'lib.jelly.Sprite'

--[[
    UI
]]
Button = require 'lib.jelly.modules.ui.Button'