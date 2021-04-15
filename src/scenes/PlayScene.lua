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
        scale = Vector2(8, 8),
        origin = 'center'
    }
    self.player:changeAnimation('idle')

    _G.event:add('on_space')
    _G.event:hook('on_space', function()
        print('Spaace... SPAAAAAAAACE!')
    end)
end

function PlayScene:update(dt)
    if _G.keyboard:keydown('escape') then love.event.quit() end

    if _G.keyboard:key('left') or _G.gamepad:button(1, 'dpleft') then
        self.player:flipH(true)
        self.player:changeAnimation('run')
    elseif _G.keyboard:key('right') or _G.gamepad:button(1, 'dpright') then
        self.player:flipH(false)
        self.player:changeAnimation('run')
    else
        self.player:changeAnimation('idle')
    end
    
    if _G.keyboard:keydown('space') or _G.gamepad:buttondown(1, 'a') then
        _G.event:dispatch('on_space')
        _G.sounds['jump']:stop()
        _G.sounds['jump']:play()
    end

    if _G.gamepad:buttondown(1, 'b') then
        _G.sceneManager:pop()
    end

    self.player:update(dt)
end

function PlayScene:draw()
    love.graphics.clear(PALETTE['blue'])
    self.player:draw()
end

return PlayScene