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

local defaultLabelColors = {
    ['default'] = PALETTE['white'],
    ['highlighted'] = PALETTE['dark-grey'],
    ['pressed'] = PALETTE['light-grey'],
    ['disabled'] = PALETTE['light-grey'],
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

    love.graphics.setColor(self.currentLabelColor)
    love.graphics.setFont(self.font)
    local y = self.position.y - love.graphics.getFont():getHeight() / 2 + offsetY
    love.graphics.printf(self.label, self.position.x - self.origin.x, y, self.size.x, 'center')
end

local function changeColors(self, state)
    self.currentColor = self.colors[state]
    self.currentLabelColor = self.labelColors[state]
end

local function mouseInBounds(self, mx, my)
    local x = self.position.x - self.origin.x
    local y = self.position.y - self.origin.y

    return mx >= x and mx <= x + self.size.x and my >= y and my < y + self.size.y
end

function Button:new(label, options)
    print(label)
    self.label = label or 'BUTTON'
    self.labelColors = options.labelColors or defaultLabelColors
    self.labelSize = options.labelSize or 'small'
    self.position = options.position
    self.colors = options.colors or defaultColors
    self.radius = options.radius or Vector2(0, 0)
    self.origin = Vector2(0, 0)
    self.maxWidth = options.maxWidth or VIRTUAL_WIDTH / 2
    self.padding = options.padding or Vector2(0, 0)

    self.font = options.font or _G.fonts[self.labelSize]
    self.textWidth, self.textLines = self.font:getWrap(self.label, self.maxWidth)
    self.size = options.size and Vector2(options.size.x + (self.padding.x * 2), options.size.y + (self.padding.y * 2)) or Vector2(self.font:getWidth(self.label) + (self.padding.x * 2), (self.font:getHeight() * #self.textLines) + (self.padding.y * 2))

    self.disabled = false

    self:setOrigin(options.origin or 'center')
    self.currentColor = self.colors['default']
    self.currentLabelColor = self.labelColors['default']
end

function Button:update(dt)
    local mousePos = _Game.mouse:getPos()
    if not self.disabled then
        if mouseInBounds(self, mousePos.x, mousePos.y) then
            if _Game.mouse:button(1) then
                changeColors(self, 'pressed')
                _Game.event:dispatch('onButtonClick', self)
            else
                changeColors(self, 'highlighted')
            end
        else
            changeColors(self, 'default')
        end
    else
        changeColors(self, 'disabled')
    end
end

function Button:draw()
    love.graphics.setColor(self.currentColor)
    love.graphics.rectangle(
        'fill',
        self.position.x - self.origin.x,
        self.position.y - self.origin.y,
        self.size.x, self.size.y,
        self.radius.x, self.radius.y
    )
    drawLabel(self)
end

return Button