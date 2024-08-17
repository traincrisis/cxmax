name = "CX-Max CCW Worm"
id = "CXMAX_WORMCCW"
author = "traincrisis"
texture = "cxmax_wormCCW.png"
updateIndex = 29000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local cellAhead = this.GetCell(this.direction, 1)

    -- Check if there is a cell ahead
    if cellAhead and cellAhead.name ~= "EMPTY" then
        -- Delete the cell ahead
        cellAhead.Delete()

        -- Calculate the new direction (CCW rotation)
        local newDirection = (this.direction + 3) % 4

        -- Create a new Worm cell ahead with the rotated direction
        grid.CreateCell("CXMAX_WORMCCW", cellAhead.x, cellAhead.y, newDirection)

        -- Delete itself
        this.Delete()
    end
end

