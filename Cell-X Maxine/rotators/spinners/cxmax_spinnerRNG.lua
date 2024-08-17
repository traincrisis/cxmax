name = "CX-Max Random Spinner"
id = "CXMAX_SPINNERRNG"
author = "traincrisis"
texture = "cxmax_spinnerRNG.png"
updateIndex = 7000

function Start(this)
    math.randomseed(os.time())  -- Seed the random number generator
end

function Step(this)
    -- Define possible spin directions
    local spinDirections = {1, -1}  -- 1 for CW, -1 for CCW
    local spinDirection = spinDirections[math.random(1, 2)]
    
    -- Get the four adjacent cells in clockwise order
    local adjacent = {
        this.GetCell(this.direction, 1),  -- Right
        this.GetCell((this.direction + 1) % 4, 1),  -- Bottom
        this.GetCell((this.direction + 2) % 4, 1),  -- Left
        this.GetCell((this.direction + 3) % 4, 1)   -- Top
    }

    -- Store the positions of the cells
    local positions = {}
    for i, cell in ipairs(adjacent) do
        positions[i] = {x = cell.x, y = cell.y}
    end

    -- Delete all adjacent cells
    for _, cell in ipairs(adjacent) do
        if cell.name ~= "EMPTY" then
            cell.Delete()
        end
    end

    -- Create new cells in their new positions
    for i, cell in ipairs(adjacent) do
        local newDir = (this.direction + (i - 1) * spinDirection) % 4  -- Calculate new direction
        local newPosIndex = (i - 1 + spinDirection) % 4 + 1  -- Rotate positions
        local newPos = positions[newPosIndex]

        if cell.name ~= "EMPTY" then
            grid.CreateCell(cell.name, newPos.x, newPos.y, newDir)
        end
    end
end
