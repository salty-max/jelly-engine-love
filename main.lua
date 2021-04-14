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



function love.load()
    love.window.setTitle(TITLE)
    math.randomseed(os.time())
    
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)

    
    KM = KeyboardManager()
    GPM = GamepadManager(true)
    SM = SceneManager ('src.scenes', { 'StartScene', 'PlayScene' })

    GPM.event:hook('controller_added', function(joyId)
        print('controller ' ..joyId.. ' added')
    end)
    GPM.event:hook('controller_removed', function(joyId)
        print('controller ' ..joyId.. ' removed')
    end)

    SM:change('StartScene')
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    SM:update(dt)

    KM:update(dt)
    GPM:update(dt)
end

function love.draw()
    Push:start()

    SM:draw()

    _.displayFPS()
    Push:finish()
end