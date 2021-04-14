--[[
    SPRITE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Sprite = Drawable:extends('Sprite')

function Sprite:new(data)
    self.animations = self:createAnimations(data.animations)
    self.position = data.position
    self.size = data.size
    
    self.rotation = data.rotation or 0
    self.scale = data.scale or Vector2(1, 1)
    self.origin = Vector2(0, 0)
    
    self.flip = Vector2(1, 1)
    self.currentAnimation = nil
    self:setOrigin(data.origin or 'center')
end

function Sprite:createAnimations(animations)
    assert(type(animations) == 'table', 'Sprite:createAnimations -> animations parameter must be a table')
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

function Sprite:flipH(flip)
    if flip then
        self.flip.x = -1
    else
        self.flip.x = 1
    end
end

function Sprite:flipY(flip)
    if flip then
        self.flip.y = -1
    else
        self.flip.y = 1
    end
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
        math.rad(self.rotation), self.scale.x * self.flip.x, self.scale.y * self.flip.y,
        self.origin.x, self.origin.y
    )
end

return Sprite