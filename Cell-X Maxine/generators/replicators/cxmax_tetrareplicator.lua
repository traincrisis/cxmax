name = "CX-Max Tetrareplicator"
id = "CXMAX_TETRAREPLICATOR"
author = "traincrisis"
texture = "cxmax_tetrareplicator.png"
updateIndex = 1000

function Step(this)
    -- Define directions
    local directions = {
        this.direction,                     -- Forward
        (this.direction + 1) % 4,           -- Right
        (this.direction + 2) % 4,           -- Backward
        (this.direction + 3) % 4            -- Left
    }

    for _, dir in ipairs(directions) do
        local cellAhead = this.GetCell(dir, 1)
        
        if cellAhead and cellAhead.name ~= "EMPTY" and cellAhead.name ~= "ENEMY" then
            if this.GetCell(dir, 2).Push(dir, 1)[1] then
                local newCell = this.GetCell(dir, 2)
                grid.CreateCell(cellAhead.name, newCell.x, newCell.y, cellAhead.direction)
            end
        end
    end
end

