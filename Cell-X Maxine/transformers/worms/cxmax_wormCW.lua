name = "CX-Max CW Worm"
id = "CXMAX_WORMCW"
author = "traincrisis"
texture = "cxmax_wormCW.png"
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

        -- Calculate the new direction (CW rotation)
        local newDirection = (this.direction + 1) % 4

        -- Create a new Worm cell ahead with the rotated direction
        grid.CreateCell("CXMAX_WORMCW", cellAhead.x, cellAhead.y, newDirection)

        -- Delete itself
        this.Delete()
    end
end

