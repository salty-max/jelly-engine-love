--[[
    GAMEPAD MANAGER CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

require 'lib.jelly.conf.config'

local GamepadManager = Class:extends('GamepadManager')

local function hookLoveEvents(self)
    function love.joystickadded(joystick)
        local id = joystick:getID()

        assert(self.connectedSticks[id] == nil, string.format('Joystick "%s" already exists', id))

        self.connectedSticks[id] = joystick
        self.isConnected[id] = true
        self.buttonMap[id] = {}
        
        self.event:dispatch('controller_added', id)
    end
    
    function love.joystickremoved(joystick)
        local id = joystick:getID()
        
        assert(self.connectedSticks[id], string.format('Joystick "%s" does not exist', id))
        
        self.connectedSticks[id] = nil
        self.isConnected[id] = false
        self.buttonMap[id] = nil

        self.event:dispatch('controller_removed', id)
    end

    function love.gamepadpressed(joystick, button)
        local id = joystick:getID()
        print(button)
        self.buttonMap[id][button] = true
    end

    function love.gamepadreleased(joystick, button)
        local id = joystick:getID()
        self.buttonMap[id][button] = false
    end
end

function GamepadManager:new(adEnabled)
    love.joystick.loadGamepadMappings('lib/jelly/data/gamecontrollerdb.txt')

    -- if true, the left analog joystick axes will be converted to their corresponding dpad buttons
    self.adEnabled = adEnabled

    -- currently connected joysticks
    self.connectedSticks = {}
    self.isConnected = {}
    -- maps a joystick id to a table of key values
    -- where the key is a button and the value is either true = just_pressed,
    -- false = just_release, nil = none
    self.buttonMap = {}

    self.event = Event()
    self.event:add('controller_added')
    self.event:add('controller_removed')

    hookLoveEvents(self)
end

function GamepadManager:exists(joyID)
    return self.isConnected[joyID]
end

function GamepadManager:getStick(joyId)
    return self.connectedSticks[joyId]
end

--[[
    Returns the state of the requested button for the given joystick
]]
function GamepadManager:button(joyID, button)
    local stick = self.connectedSticks[joyID]
    if not self.isConnected[joyID] then return false end

    local isDown = stick:isGamepadDown(button)
    
    -- do the left joystick act as a d-pad?
    if self.adEnabled and not isDown then
        local xAxis = stick:getGamepadAxis('leftx')
        local yAxis = stick:getGamepadAxis('lefty')

        if button == 'dpleft' then
            isDown = xAxis < -DEAD_ZONE
        elseif button == 'dpright' then
            isDown = xAxis > DEAD_ZONE
        elseif button == 'dpup' then
            isDown = yAxis < -DEAD_ZONE
        elseif button == 'dpdown' then
            isDown = yAxis > DEAD_ZONE
        end
    end

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
    -- update the button states for all connected joysticks
    for i = 1, #self.isConnected do
        if self.buttonMap[i] then
            for k,_ in pairs(self.buttonMap[i]) do
                self.buttonMap[i][k] = nil
            end
        end
    end
end
return GamepadManager