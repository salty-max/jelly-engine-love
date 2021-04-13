Class = require 'src/Class'

local Animal = Class:extends('Animal')

function Animal:SoundOff()
    print 'uh?'
end

local a = Animal()
a:SoundOff()
print(a:getType())

local Cat = Animal:extends 'Cat'
function Cat:SoundOff()
    print 'Meow'
end

local c = Cat()
c:SoundOff()
print(c:getType())

local Neko = Cat:extends('Neko')
local n = Neko()
print(n:getType(), n.super:getType(), n.super.super:getType())