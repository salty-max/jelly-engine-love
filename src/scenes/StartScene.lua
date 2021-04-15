--[[
    START SCENE CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local StartScene = Scene:extends('StartScene')

local function onClick(button)
    _G.sceneManager:change('PlayScene')
end

function StartScene:new()
    self.button = Button {
        position = Vector2(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2),
        label = 'PLAY',
        size = Vector2(128, 32),
        colors = { default = PALETTE['green'], highlighted = PALETTE['dark-green'], pressed = PALETTE['green'], disabled = PALETTE['dark-grey'] },
        radius = Vector2(4, 4),
    }

    _G.event:hook('onButtonClick', onClick)
end

function StartScene:update(dt)
    self.button:update(dt)
    if _G.keyboard:keydown('escape') then love.event.quit() end

    if _G.keyboard:keydown('enter') or _G.keyboard:keydown('return') or _G.gamepad:buttondown(1, 'start') then
        _G.sceneManager:change('PlayScene')
    end
end

function Scene:draw()
    love.graphics.clear(PALETTE['dark-blue'])
    love.graphics.draw(_G.textures['logo'], VIRTUAL_WIDTH / 2 - Logo:getWidth() / 2, 32)
    love.graphics.setFont(_G.fonts['medium'])
    love.graphics.setColor(PALETTE['blue'])
    love.graphics.printf('JELLY ENGINE', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1,1,1,1)

    self.button:draw()
end

return StartScene