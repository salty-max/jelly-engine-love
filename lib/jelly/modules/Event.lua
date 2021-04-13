--[[
    EVENT CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Event = Class:extends('Event')

function Event:new(eventRequired)
    self.listeners = {}
    self.eventRequired = (eventRequired == nil) or eventRequired
end

--[[
    Adds a listener to the registry
]]
function Event:add(t)
    assert(self.listeners[t] == nil, string.format('Event:add -> event "%s" already exists', t))

    self.listeners[t] = {}
end

function Event:remove(t)
    assert(self.listeners[t], string.format('Event:remove -> Event of type "%s" does not exist', t))

    self.listeners[t] = nil
end

function Event:hook(t, callback)
    assert(type(callback) == 'function', 'Event:hook -> callback parameter must be a function')

    -- if event doen't exist yet, create it    
    if self.eventRequired then
        assert(self.listeners[t], string.format('Event:hook -> Event of type "%s" does not exist', t))
    elseif self.listeners[t] == nil then
        self:add(t)
    end

    assert(_.indexOf(self.listeners[t], callback) == -1, 'Event:hook -> callback has already been registered')

    local tbl = self.listeners[t]
    tbl[#tbl+1] = callback
end

function Event:unhook(t, callback)
    assert(type(callback) == 'function', 'Event:hook -> callback parameter must be a function')

    if self.listeners[t] == nil then return end

    local index = _.indexOf(self.listeners[t], callback)
    if index > -1 then
        table.remove(self.listeners[t], index)
    end
end

--[[
    Clears out listeners for a given type
]]
function Event:clear(t)
    if t == nil then
        for i = 1, #self.listeners do
            self.listeners[i] = {}
        end
    elseif self.listeners[t] then
        self.listeners[t] = {}
    end
end

function Event:dispatch(t, ...)
    assert(self.listeners[t], string.format('Event:hook -> Event of type [%s] does not exist', { t }))

    local tbl = self.listeners[t]
    for i = 1, #tbl do
        tbl[i](...)
    end
end

return Event