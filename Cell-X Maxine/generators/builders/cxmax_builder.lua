name = "CX-Max Builder"
id = "CXMAXBUILDER"
author = "traincrisis"
texture = "cxmax_builder.png"
updateIndex = 1000

function Push(this, dir, bias)

    if this.GetCell(this.direction, -1).name ~= "EMPTY" then
        if this.GetCell(this.direction, 1).name ~= "ENEMY" and this.GetCell(this.direction, 1).Push(this.direction, 1)[1] then
            infront = this.GetCell(this.direction, 1)
            grid.CreateCell(this.GetCell(this.direction, -1).name, infront.x, infront.y, this.GetCell(this.direction, -1).direction)
		end
    end
    return this.Push(dir, bias)
end
