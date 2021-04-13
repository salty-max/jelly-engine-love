--[[
    MAIN PROGRAM
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

-- enable console output
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src.deps'

local sprite = Sprite {
    animations = ENTITY_DEFS['player'].animations,
    position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
    size = Vector2(TILE_SIZE, TILE_SIZE),
    scale = Vector2(8, 8)
}

local KM = KeyboardManager()
local GPM = GamepadManager()

function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())
    
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)
    
    KM:hookLoveEvents()

    EM = EventManager()
    EM:add('on_space')
    EM:hook('on_space', OnSpace)
    
    sprite:changeAnimation('swim')
end

function OnSpace()
    print('Spaace... SPAAAAAAAACE!')
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    
    sprite:update(dt)
    
    if KM:key('left') then
        sprite:flipH(true)
        sprite:changeAnimation('run')
    elseif KM:key('right') then
        sprite:flipH(false)
        sprite:changeAnimation('run')
    else
        sprite:changeAnimation('idle')
    end
    
    if KM:keydown('space') then
        EM:dispatch('on_space')
        G_Sounds['jump']:stop()
        G_Sounds['jump']:play()
    end

    KM:update(dt)
    GPM:update(dt)
end

function love.draw()
    Push:start()

    love.graphics.clear(_.rgbaToLove(52, 73, 94, 255))
    sprite:draw()

    _.displayFPS()
    Push:finish()
end