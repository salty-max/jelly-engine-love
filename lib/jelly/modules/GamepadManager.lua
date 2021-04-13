--[[
    GAMEPAD MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local GamepadManager = Class:extends('GamepadManager')

local function hookLoveEvents(self)
    function love.joystickadded(joystick)
        local id = joystick.getID()

        assert(self.connectedSticks[id] == nil, string.format('Joystick "%s" already exists', id))

        self.connectedSticks[id] = joystick
        self.isConnected[id] = true
        self.buttonMap[id] = {}
        
        -- TODO: Register a controller_added event here
    end
    
    function love.joystickremoved(joystick)
        local id = joystick.getID()
        
        assert(self.connectedSticks[id], string.format('Joystick "%s" does not exist', id))
        
        self.connectedSticks[id] = nil
        self.isConnected[id] = false
        self.buttonMap[id] = nil

        -- TODO: Register a controller_removed event here
    end

    function love.gamepadpressed(joystick, button)
        local id = joystick.getID()
        self.buttonMap[id][button] = true
    end

    function love.gamepadreleased(joystick, button)
        local id = joystick.getID()
        self.buttonMap[id][button] = false
    end
end

function GamepadManager:new()
    love.joystick.loadGamepadMappings('lib/jelly/data/gamecontrollerdb.txt')

    -- currently connected joysticks
    self.connectedSticks = {}
    self.isConnected = {}
    -- maps a joystick id to a table of key values
    -- where the key is a button and the value is either true = just_pressed,
    -- false = just_release, nil = none
    self.buttonMap = {}

    hookLoveEvents(self)
end

--[[
    Returns the state of the requested button for the given joystick
]]
function GamepadManager:button(joyID, button)
    local stick = self.connectedSticks[joyID]
    if not self.isConnected[joyID] or stick == nil then return false end

    local isDown = stick:isGamepadDown(button)
    -- TODO: More code!

    return isDown
end

--[[
    Returns whether the given button was just pressed THIS frame
]]
function GamepadManager:buttondown(joyID, button)
    return self.isConnected[joyID] and self.buttonMap[joyID][button] or false
end

--[[
    Returns whether the given button was just released THIS frame
]]
function GamepadManager:buttonup(joyID, button)
    return self.isConnected[joyID] and not self.buttonMap[joyID][button] or false
end

function GamepadManager:update(dt)
    -- TODO: Update the button states for all connected joysticks
end
return GamepadManager