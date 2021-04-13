--[[
    BASE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Class = {}

Class.__index = Class

-- default implementation
function Class:new() end

--[[
    Makes a class inhetir from another
]]
function Class:extends(t)
    assert(t, 'Class:extends -> parameter type must not be nil')
    assert(type(t) == 'string', 'Class:extends -> type must be a string')

    local cls = {}
    cls['__call'] = Class.__call
    cls.type = t
    cls.__index = cls
    cls.super = self

    setmetatable(cls, self)
    return cls
end

--[[
    Check if the instance is a sub-class of the given type
]]
function Class:is(class)
    assert(class, 'Class:is -> parameter class must not be nil')
    assert(type(class) == 'table', 'Class:is -> parameter class must be a table')

    local mt = getmetatable(self)
    while mt do
        if mt == class then return true end
        mt = getmetatable(mt)
    end

    return false
end

function Class:isType(t)
    assert(t, 'Class:isType -> parameter type must not be nil')
    assert(type(t) == 'string', 'Class:is -> parameter type must be a string')

    local base = self
    while base do
        if base.type == t then return true end
        base = base.super
    end

    return false
end

function Class:__call(...)
    local instance = setmetatable({}, self)

    instance:new(...)
    
    return instance
end

function Class:getType()
    return self.type
end

return Class