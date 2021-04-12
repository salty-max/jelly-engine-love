--[[
    UTILITY FUNCTIONS
    
    JELLY ENGINE
    Maxime Blanc
    https://github.com/salty-max
]]

function GenerateQuads(atlas, tileWidth, tileHeight)
    local sheetWidth =  atlas:getWidth() / tileWidth
    local sheetHeight =  atlas:getHeight() / tileHeight
    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] = love.graphics.newQuad(x * tileWidth, y * tileHeight, tileWidth, tileHeight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

function RgbaToLove(r, g, b, a)
    return { r/255, g/255, b/255, a/255 }
end

function Uuid()
    local seed={'e','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    local tb={}
    for i=1,32 do
        table.insert(tb,seed[math.random(1,16)])
    end
    local sid=table.concat(tb)
    return string.format('%s-%s-%s-%s-%s',
        string.sub(sid,1,8),
        string.sub(sid,9,12),
        string.sub(sid,13,16),
        string.sub(sid,17,20),
        string.sub(sid,21,32)
    )
end

function Dump(t)
    if type(t) == 'table' then
        local s = '{ '
        for k,v in pairs(t) do
            if type(k) ~= 'number' then k = '"' ..k.. '"' end
            s = s .. '['..k..'] = ' .. Dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(t)
    end
end

function DisplayFPS()
    love.graphics.setFont(G_Fonts['medium'])
    love.graphics.setColor(RgbaToLove(11, 232, 129, 255))
    love.graphics.print('FPS: ' .. love.timer.getFPS(), 8, VIRTUAL_HEIGHT - TILE_SIZE)
    love.graphics.setColor(1, 1, 1, 1)
end