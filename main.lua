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
    scale = Vector2(8, 8)
}

local Keyboard = Keyboard()

function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)

    Keyboard:hookLoveEvents()

    sprite:changeAnimation('swim')
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    
    sprite:update(dt)
    
    if Keyboard:key('left') then
        sprite:flipH(true)
        sprite:changeAnimation('run')
    elseif Keyboard:key('right') then
        sprite:flipH(false)
        sprite:changeAnimation('run')
    else
        sprite:changeAnimation('idle')
    end
    
    if Keyboard:keydown('space') then
        G_Sounds['jump']:stop()
        G_Sounds['jump']:play()
    end

    Keyboard:update(dt)
end

function love.draw()
    Push:start()

    love.graphics.clear(_.rgbaToLove(52, 73, 94, 255))
    sprite:draw()

    _.displayFPS()
    Push:finish()
end