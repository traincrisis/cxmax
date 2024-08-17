name = "CX-Max Storage"
id = "CXMAX_STORAGE"
author = "traincrisis"
texture = "cxmax_storage.png"
updateIndex = 31000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Push(this, dir, bias)
    local pushedCell = this.GetCell(dir, -1)
    local infront = this.GetCell(dir, 1)

    if this.data.storedCell ~= "EMPTY" then
        grid.CreateCell(this.data.storedCell, infront.x, infront.y, this.data.storedCellRot)
    end
    
    this.data.storedCell = pushedCell.name
    this.data.storedCellRot = pushedCell.direction
    
    return {true, true} 
end

