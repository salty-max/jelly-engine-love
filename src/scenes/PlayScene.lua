--[[
    PLAY SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local PlayScene = Scene:extends('PlayScene')

function PlayScene:new()
    self.player = Sprite {
        animations = ENTITY_DEFS['player'].animations,
        position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
        size = Vector2(TILE_SIZE, TILE_SIZE),
        scale = Vector2(8, 8)
    }
    self.player:changeAnimation('idle')

    self.event = Event()
    self.event:add('on_space')
    self.event:hook('on_space', function()
        print('Spaace... SPAAAAAAAACE!')
    end)
end

function PlayScene:update(dt)
    if KM:keydown('escape') then love.event.quit() end

    if KM:key('left') or GPM:button(1, 'dpleft') then
        self.player:flipH(true)
        self.player:changeAnimation('run')
    elseif KM:key('right') or GPM:button(1, 'dpright') then
        self.player:flipH(false)
        self.player:changeAnimation('run')
    else
        self.player:changeAnimation('idle')
    end
    
    if KM:keydown('space') or GPM:buttondown(1, 'a') then
        self.event:dispatch('on_space')
        G_Sounds['jump']:stop()
        G_Sounds['jump']:play()
    end

    if GPM:buttondown(1, 'b') then
        SM:pop()
    end

    self.player:update(dt)
end

function PlayScene:draw()
    love.graphics.clear(_.rgbaToLove(52, 73, 94, 255))
    self.player:draw()
end

return PlayScene