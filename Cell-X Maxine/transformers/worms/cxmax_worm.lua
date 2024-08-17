name = "CX-Max Worm"
id = "CXMAX_WORM"
author = "traincrisis"
texture = "cxmax_worm.png"
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

        -- Create a new Worm cell ahead
        grid.CreateCell("CXMAX_WORM", cellAhead.x, cellAhead.y, this.direction)

        -- Delete itself
        this.Delete()
    end
end

