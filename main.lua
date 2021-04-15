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

    
    _G.event = Event(false)
    _G.keyboard = KeyboardManager()
    _G.mouse = MouseManager()
    _G.gamepad = GamepadManager(true)
    _G.sceneManager = SceneManager ('src.scenes', { 'StartScene', 'PlayScene' })

    _G.event:hook('controller_added', function(joyId)
        print('controller ' ..joyId.. ' added')
    end)
    _G.event:hook('controller_removed', function(joyId)
        print('controller ' ..joyId.. ' removed')
    end)

    _G.sceneManager:change('StartScene')
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    _G.sceneManager:update(dt)

    _G.keyboard:update(dt)
    _G.mouse:update(dt)
    _G.gamepad:update(dt)
end

function love.draw()
    Push:start()

    _G.sceneManager:draw()

    _.displayFPS()
    Push:finish()
end