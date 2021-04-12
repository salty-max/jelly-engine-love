--[[
    MAIN PROGRAM
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

-- enable console output
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src/Dependencies'

local x = 120
local dir = 1
local width = 96
local height = 48

function love.load()
    print 'Hello World'
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
    if x >= math.floor(VIRTUAL_WIDTH - width) or x <= 0 then
        dir = dir * -1
    end

    x = x + (dir * 200 * dt)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsClicked = {}
end

function love.draw()
    Push:start()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Hello World!", 8, 8)
    love.graphics.setColor(128/255, 64/255, 1, 1)
    love.graphics.rectangle('fill', x, VIRTUAL_HEIGHT / 2 - height / 2, width, height)
    Push:finish()
end