name = "CX-Max Destrove"
id = "CXMAX_DESTROVE"
author = "traincrisis"
texture = "cxmax_destrove.png"
updateIndex = 38000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    local pushedCell = this.GetCell(dir, -1)
    grid.CreateCell("WALL", pushedCell.x, pushedCell.y, this.direction)
    this.PlaySound("cxmax_destroved.wav")
    return {true, true}
end

