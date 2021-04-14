--[[
    UI BUTTON CLASS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

local Button = Drawable:extends('Button')

local defaultColors = {
    ['default'] = PALETTE['white'],
    ['highlighted'] = PALETTE['light-grey'],
    ['pressed'] = PALETTE['dark-grey'],
    ['disabled'] = PALETTE['dark-grey'],
}

local function drawLabel(self)
    local offsetY = 0

    if self.origin.y == self.size.y then
        offsetY = -self.size.y / 2
    elseif self.origin.y == self.size.y / 2 then
        offsetY = 0
    else
        offsetY = self.size.y / 2
    end

    love.graphics.setColor(self.labelColor)
    love.graphics.setFont(G_Fonts['medium'])
    local y = self.position.y - love.graphics.getFont():getHeight() / 2 + offsetY
    love.graphics.printf(self.label, self.position.x - self.origin.x, y, self.size.x, 'center')
end

function Button:new(data)
    self.label = data.label or 'BUTTON'
    self.labelColor = data.labelColor or PALETTE['white']
    self.position = data.position
    self.size = data.size
    self.colors = data.colors or defaultColors
    self.radius = data.radius or Vector2(0, 0)
    self.origin = Vector2(0, 0)

    self:setOrigin(data.origin or 'center')
    self.currentColor = self.colors['default']
end

function Button:draw()
    local r,g,b,a = love.graphics.getColor()

    love.graphics.setColor(self.currentColor)
    love.graphics.rectangle('fill', self.position.x - self.origin.x, self.position.y - self.origin.y, self.size.x, self.size.y, self.radius.x, self.radius.y)
    drawLabel(self)

    love.graphics.setColor({ r,g,b,a })
end

return Button