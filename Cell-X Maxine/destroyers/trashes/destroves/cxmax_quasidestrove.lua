name = "CX-Max Quasi-Destrove"
id = "CXMAX_QUASIDESTROVE"
author = "traincrisis"
texture = "cxmax_quasidestrove.png"
updateIndex = 39000

function Push(this, dir, bias)
    -- Check if the push is from the front
    if dir == (this.direction + 2) % 4 then
        local pushedCell = this.GetCell(dir, -1)
        grid.CreateCell("WALL", pushedCell.x, pushedCell.y, this.direction)
        this.PlaySound("cxmax_destroved.wav")
        return {true, true}
    else
        -- Act like a Pushable from the sides
        return this.Push(dir, bias)
    end
end

