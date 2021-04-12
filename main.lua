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

local sprite = Sprite {
    animations = ENTITY_DEFS['player'].animations,
    position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
    size = Vector2(TILE_SIZE, TILE_SIZE),
    scale = Vector2(4, 4),
}

function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)

    sprite:changeAnimation('run')

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
    -- avoid freeze on update pause
    if dt > 0.036 then return end
    
    sprite:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsClicked = {}
end

function love.draw()
    Push:start()

    love.graphics.clear(RgbaToLove(60, 64, 198, 255))
    sprite:draw()

    DisplayFPS()
    Push:finish()
end