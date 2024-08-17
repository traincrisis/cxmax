name = "CX-Max Random Worm"
id = "CXMAX_WORMRNG"
author = "traincrisis"
texture = "cxmax_wormRNG.png"
updateIndex = 29000

function Start(this)
    math.randomseed(os.time()) -- Seed the random number generator
end

-- Function to get a random rotation direction
function GetRandomRotation()
    return math.random(0, 1) -- Returns 0 (CCW) or 1 (CW)
end

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    -- Check if there is a cell ahead
    if cellAhead and cellAhead.name ~= "EMPTY" then
        -- Delete the cell ahead
        cellAhead.Delete()

        -- Determine the new direction based on random choice
        local randomChoice = GetRandomRotation()
        local newDirection

        if randomChoice == 0 then
            -- Rotate CCW (90 degrees)
            newDirection = (this.direction + 3) % 4
        else
            -- Rotate CW (90 degrees)
            newDirection = (this.direction + 1) % 4
        end

        -- Create a new Worm cell ahead with the chosen rotation
        grid.CreateCell("CXMAX_WORMRNG", cellAhead.x, cellAhead.y, newDirection)

        -- Delete itself
        this.Delete()
    end
end

