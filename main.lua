--[[
    MAIN PROGRAM
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src/Dependencies'

function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsClicked = {}
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mousepressed(x, y, button)
    love.mouse.buttonsClicked[button] = true
end

function love.mouse.wasClicked(button)
    return love.mouse.buttonsClicked[button]
end

function love.update(dt)
    love.keyboard.keysPressed = {}
    love.mouse.buttonsClicked = {}
end

function love.draw()
    Push:start()
    Push:finish()
end