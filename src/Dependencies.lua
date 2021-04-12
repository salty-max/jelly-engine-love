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
    ['small'] = love.graphics.newFont('assets/fonts/pico8.ttf', 12),
    ['medium'] = love.graphics.newFont('assets/fonts/pico8.ttf', 24),
    ['large'] = love.graphics.newFont('assets/fonts/pico8.ttf', 48)
}