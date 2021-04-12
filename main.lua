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

local angle = 0
local scale = 1
local scaleDir = 1

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
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    angle = angle + 45 * dt
    scale = scale + (scaleDir * dt)

    if scale <= 0.5 then
        scaleDir = 1
    elseif scale >= 2 then
        scaleDir = -1
    end

    

    love.keyboard.keysPressed = {}
    love.mouse.buttonsClicked = {}
end

function love.draw()
    Push:start()
    love.graphics.clear(RgbaToLove(60, 64, 198, 255))
    love.graphics.setColor(RgbaToLove(87, 95, 207, 255))
    love.graphics.setFont(G_Fonts['medium'])
    love.graphics.printf('HELLO WORLD!', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(
        G_Textures['foxy'],
        G_Frames['foxy'][1],
        VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2,
        math.rad(angle), scale, scale,
        TILE_SIZE / 2, TILE_SIZE / 2
    )

    DisplayFPS()
    Push:finish()
end