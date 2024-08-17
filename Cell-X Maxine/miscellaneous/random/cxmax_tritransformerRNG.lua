name = "CX-Max Random Tritransformer"
id = "CXMAX_TRITRANSFORMERRNG"
author = "traincrisis"
texture = "cxmax_tritransformerRNG.png"
updateIndex = 32000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

-- Function to get a random direction choice
function GetRandomDirectionChoice()
    return math.random(0, 4) -- Returns 0 (all), 1 (right), 2 (left), 3 (front), or 4 (right+front), 5 (left+front), 6 (right+left), or 7 (all directions)
end

function Step(this)
    -- Direction offsets for getting cells
    local rightDirection = (this.direction + 1) % 4  -- CW direction (right)
    local leftDirection = (this.direction + 3) % 4  -- CCW direction (left)
    local frontDirection = this.direction
    local behindDirection = (this.direction + 2) % 4

    -- Get the cells to the left, right, front, and behind the Transformer
    local cellLeft = this:GetCell(leftDirection, 1)
    local cellRight = this:GetCell(rightDirection, 1)
    local cellFront = this:GetCell(frontDirection, 1)
    local cellBehind = this:GetCell(behindDirection, 1)

    -- Randomly choose which direction(s) to transform
    local randomChoice = GetRandomDirectionChoice()

    if cellBehind and cellLeft and cellRight and cellFront and 
       cellBehind.name ~= "EMPTY" then
        if randomChoice == 0 then
            -- Transform all directions (right, left, and front)
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
            if cellFront.name ~= "EMPTY" then
                cellFront:Delete()
                grid.CreateCell(cellBehind.name, cellFront.x, cellFront.y, cellBehind.direction)
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
        elseif randomChoice == 3 then
            -- Transform only front
            if cellFront.name ~= "EMPTY" then
                cellFront:Delete()
                grid.CreateCell(cellBehind.name, cellFront.x, cellFront.y, cellBehind.direction)
            end
        elseif randomChoice == 4 then
            -- Transform right and front
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
            if cellFront.name ~= "EMPTY" then
                cellFront:Delete()
                grid.CreateCell(cellBehind.name, cellFront.x, cellFront.y, cellBehind.direction)
            end
        elseif randomChoice == 5 then
            -- Transform left and front
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
            if cellFront.name ~= "EMPTY" then
                cellFront:Delete()
                grid.CreateCell(cellBehind.name, cellFront.x, cellFront.y, cellBehind.direction)
            end
        elseif randomChoice == 6 then
            -- Transform right and left
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
        elseif randomChoice == 7 then
            -- Transform all directions (right, left, front)
            if cellRight.name ~= "EMPTY" then
                cellRight:Delete()
                grid.CreateCell(cellBehind.name, cellRight.x, cellRight.y, cellBehind.direction)
            end
            if cellLeft.name ~= "EMPTY" then
                cellLeft:Delete()
                grid.CreateCell(cellBehind.name, cellLeft.x, cellLeft.y, cellBehind.direction)
            end
            if cellFront.name ~= "EMPTY" then
                cellFront:Delete()
                grid.CreateCell(cellBehind.name, cellFront.x, cellFront.y, cellBehind.direction)
            end
        end
    end
end

