name = "CX-Max Random Bigenerator"
id = "CXMAX_BIGENERATORRNG"
author = "traincrisis"
texture = "cxmax_bigeneratorRNG.png"
updateIndex = 10000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

function Step(this)
    -- Define the right and left directions relative to the current direction
    local rightDirection = (this.direction + 1) % 4
    local leftDirection = (this.direction + 3) % 4

    -- Function to handle cell generation
    local function generateCells(targetDirection, sourceDirection)
        -- Check if there is a cell behind the Generator
        if this.GetCell(sourceDirection, -1).name ~= "EMPTY" then
            -- Push cells ahead in the target direction
            local pushed = this.GetCell(targetDirection, 1).Push(targetDirection, 1)[1]
            
            -- If cells were pushed, duplicate the cell behind in the target direction
            if pushed then
                local infront = this.GetCell(targetDirection, 1)
                grid.CreateCell(this.GetCell(sourceDirection, -1).name, infront.x, infront.y, this.GetCell(sourceDirection, -1).direction)
            end
        end
    end

    -- Randomly choose CW, CCW, or both
    local choice = math.random(3)

    if choice == 1 then
        -- Generate cells to the right
        generateCells(rightDirection, this.direction)
    elseif choice == 2 then
        -- Generate cells to the left
        generateCells(leftDirection, this.direction)
    else
        -- Generate cells to both directions
        generateCells(rightDirection, this.direction)
        generateCells(leftDirection, this.direction)
    end
end

