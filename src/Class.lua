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

-- extend base Class
function Class:extends(type)
    assert(type(type) == 'string', 'Class:extends -> type must be a string')
    local cls = {}

    cls.type = type
    cls.__index = cls
    cls.super = self

    setmetatable(cls, self)
    return cls
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