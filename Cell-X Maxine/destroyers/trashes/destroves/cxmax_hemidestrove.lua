name = "CX-Max Hemi-Destrove"
id = "CXMAX_HEMIDESTROVE"
author = "traincrisis"
texture = "cxmax_hemidestrove.png"
updateIndex = 40000

function Push(this, dir, bias)
    if dir == (this.direction + 2) % 4 or dir == (this.direction + 1) % 4 then
        -- Convert the cell in front or behind into a WALL
        local pushedCell = this.GetCell(dir, -1)
        if pushedCell and pushedCell.name ~= "EMPTY" then
            grid.CreateCell("WALL", pushedCell.x, pushedCell.y, this.direction)
            this.PlaySound("cxmax_destroved.wav")
            pushedCell.Delete()
        end
        return {false, true}
    else
        -- Act like a Pushable from the sides
        return this.Push(dir, bias)
    end
end

