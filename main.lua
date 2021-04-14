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

-- local sprite = Sprite {
--     animations = ENTITY_DEFS['player'].animations,
--     position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
--     size = Vector2(TILE_SIZE, TILE_SIZE),
--     scale = Vector2(8, 8)
-- }

-- local KM = KeyboardManager()

function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())
    
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)

    -- Event = Event()
    -- Event:add('on_space')
    -- Event:hook('on_space', function()
    --     print('Spaace... SPAAAAAAAACE!')
    -- end)
    GPM = GamepadManager(true)

    GPM.event:hook('controller_added', function(joyId)
        print('controller ' ..joyId.. ' added')
    end)
    GPM.event:hook('controller_removed', function(joyId)
        print('controller ' ..joyId.. ' removed')
    end)

    SM = SceneManager {
        ['start'] = function() return StartScene() end
    }
    SM:change('start')
    
    -- sprite:changeAnimation('swim')
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    SM:update(dt)

    
    -- sprite:update(dt)
    
    -- if KM:key('left') or GPM:button(1, 'dpleft') then
    --     sprite:flipH(true)
    --     sprite:changeAnimation('run')
    -- elseif KM:key('right') or GPM:button(1, 'dpright') then
    --     sprite:flipH(false)
    --     sprite:changeAnimation('run')
    -- else
    --     sprite:changeAnimation('idle')
    -- end
    
    -- if KM:keydown('space') or GPM:buttondown(1, 'a') then
    --     Event:dispatch('on_space')
    --     G_Sounds['jump']:stop()
    --     G_Sounds['jump']:play()
    -- end

    -- KM:update(dt)
    -- GPM:update(dt)
end

function love.draw()
    Push:start()

    SM:draw()
    -- sprite:draw()

    _.displayFPS()
    Push:finish()
end