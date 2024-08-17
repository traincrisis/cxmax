name = "CX-Max Random Bitransformer"
id = "CXMAX_BITRANSFORMERRNG"
author = "traincrisis"
texture = "cxmax_bitransformerRNG.png"
updateIndex = 31000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

-- Function to get a random direction choice
function GetRandomDirectionChoice()
    return math.random(0, 2) -- Returns 0 (both), 1 (right), or 2 (left)
end

function Step(this)
    -- Direction offsets for getting cells
    local leftDirection = (this.direction + 3) % 4  -- CCW direction (left)
    local rightDirection = (this.direction + 1) % 4  -- CW direction (right)
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the left, right, and behind the Transformer
    local cellLeft = this:GetCell(leftDirection, 1)
    local cellRight = this:GetCell(rightDirection, 1)
    local cellBehind = this:GetCell(behindDirection, 1)

    -- Randomly choose which direction(s) to transform
    local randomChoice = GetRandomDirectionChoice()

    if cellBehind and cellLeft and cellRight and 
       cellBehind.name ~= "EMPTY" then
        if randomChoice == 0 then
            -- Transform both left and right
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
        elseif randomChoice == 1 then
            -- Transform only right
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
        elseif randomChoice == 2 then
            -- Transform only left
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
        end
    end
end

