name = "CX-Max Fungal Virus"
id = "CXMAX_FUNGALVIRUS"
author = "traincrisis"
texture = "cxmax_fungalvirus.png"
updateIndex = 9200

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    local infect = this.GetCell(dir, -1) 
    infect.Delete()
    grid.CreateCell("CXMAX_FUNGALVIRUS", infect.x, infect.y, this.direction)
end

