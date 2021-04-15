--[[
    ENGINE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Game = Class:extends('Game')

local function hookLoveEvents()
    function love.resize(w, h)
        Push:resize(w, h)
    end
end

function Game:new(config)
    self.keyboardEnabled = (config.keyboardEnabled == nil) or config.keyboardEnabled
    self.mouseEnabled = (config.mouseEnabled == nil) or config.mouseEnabled
    self.gamepadEnabled = (config.gamepadEnabled == nil) or config.gamepadEnabled

    self.keyboard = nil
    self.mouse = nil
    self.gamepad = nil

    self.event = Event(false)

    self.sceneManager = SceneManager('src.scenes', config.scenes or {})

    hookLoveEvents()

    love.window.setTitle(TITLE)
    math.randomseed(os.time())
    
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_CONFIG)
end

function Game:init()
    if self.keyboardEnabled then
        self.keyboard = KeyboardManager()
    end
    if self.mouseEnabled then
        self.mouse = MouseManager()
    end
    if self.gamepadEnabled then
        self.gamepad = GamepadManager(true)

        self.event:hook('controller_added', function(joyId)
            print('controller ' ..joyId.. ' added')
        end)
        self.event:hook('controller_removed', function(joyId)
            print('controller ' ..joyId.. ' removed')
        end)
    end
end

function Game:update(dt)
    -- avoid freeze on update pause
    if dt > 0.036 then return end

    self.sceneManager:update(dt)

    self.keyboard:update(dt)
    self.mouse:update(dt)
    self.gamepad:update(dt)
end

function Game:draw()
    Push:start()

    self.sceneManager:draw()

    if self.debug then
        _.displayFPS()
    end 

    Push:finish()
end

return Game