--[[
    START SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local StartScene = Scene:extends('StartScene')

local function onClick(button)
    _Game.sceneManager:change('PlayScene')
end

function StartScene:new()
    self.button = Button('PLAY', {
        position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
        colors = { default = PALETTE['green'], highlighted = PALETTE['dark-green'], pressed = PALETTE['green'], disabled = PALETTE['dark-grey'] },
        labelColors = { default = PALETTE['white'], highlighted = PALETTE['green'], pressed = PALETTE['white'], disabled = PALETTE['light-grey'] },
        radius = Vector2(4, 4),
        padding = Vector2(8, 8),
    })
end

function StartScene:enter()
    _Game.event:hook('onButtonClick', onClick)
end

function StartScene:update(dt)
    self.button:update(dt)
    if _Game.keyboard:keydown('escape') then love.event.quit() end

    if _Game.keyboard:keydown('enter') or _Game.keyboard:keydown('return') or _Game.gamepad:buttondown(1, 'start') then
        _Game.sceneManager:change('PlayScene')
    end
end

function StartScene:draw()
    love.graphics.clear(PALETTE['dark-blue'])
    love.graphics.draw(_G.textures['logo'], VIRTUAL_WIDTH / 2 - _G.textures['logo']:getWidth() / 2, 32)
    love.graphics.setFont(_G.fonts['medium'])
    love.graphics.setColor(PALETTE['blue'])
    love.graphics.printf('JELLY ENGINE', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1,1,1,1)

    self.button:draw()
end

function StartScene:exit()
    _Game.event:unhook('onButtonClick', onClick)
end

return StartScene