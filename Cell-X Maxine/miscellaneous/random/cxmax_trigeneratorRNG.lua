name = "CX-Max Random Trigenerator"
id = "CXMAX_TRIGENERATORRNG"
author = "traincrisis"
texture = "cxmax_trigeneratorRNG.png"
updateIndex = 11000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

function Step(this)
    -- Define the forward, right, and left directions relative to the current direction
    local forwardDirection = this.direction
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

    -- Randomly choose Forward, CW, CCW, or all three
    local choice = math.random(4)

    if choice == 1 then
        -- Generate cells forward
        generateCells(forwardDirection, this.direction)
    elseif choice == 2 then
        -- Generate cells to the right (CW)
        generateCells(rightDirection, this.direction)
    elseif choice == 3 then
        -- Generate cells to the left (CCW)
        generateCells(leftDirection, this.direction)
    else
        -- Generate cells in all three directions (Forward, CW, and CCW)
        generateCells(forwardDirection, this.direction)
        generateCells(rightDirection, this.direction)
        generateCells(leftDirection, this.direction)
    end
end

