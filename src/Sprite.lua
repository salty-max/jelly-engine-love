--[[
    SPRITE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Sprite = Class:extends('Sprite')

function Sprite:new(data)
    self.animations = self:createAnimations(data.animations)
    self.position = data.position
    self.size = data.size

    self.rotation = data.rotation or 0
    self.scale = data.scale or Vector2(1, 1)
    self.origin = data.origin or Vector2(self.size.x / 2, self.size.y / 2)

    self.currentAnimation = nil
end

function Sprite:createAnimations(animations)
    local anims = {}

    for k,animation in pairs(animations) do
        anims[k] = Animation {
            name = k,
            texture = animation.texture,
            frames = animation.frames,
            fps = animation.fps,
            looping = animation.looping
        }
    end

    return anims
end

function Sprite:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Sprite:update(dt)
    if self.currentAnimation then
        self.currentAnimation:update(dt)
    end
end

function Sprite:draw()
    love.graphics.draw(
        G_Textures[self.currentAnimation.texture],
        G_Frames[self.currentAnimation.texture][self.currentAnimation:getCurrentFrame()],
        self.position.x, self.position.y,
        math.rad(self.rotation), self.scale.x, self.scale.y,
        self.origin.x, self.origin.y
    )
end

return Sprite