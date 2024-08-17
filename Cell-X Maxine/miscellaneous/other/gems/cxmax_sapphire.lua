name = "CX-Max Sapphire"
id = "CXMAX_SAPPHIRE"
author = "traincrisis"
texture = "cxmax_sapphire.png"
updateIndex = 25000

function Push(this, dir, bias)
    local leftMoverType = this.GetCell(dir, -1)
    local leftLeftMoverType = this.GetCell(dir, -2)
    local leftLeftLeftMoverType = this.GetCell(dir, -3)
    local rightMoverType = this.GetCell(dir, 1)
    local rightRightMoverType = this.GetCell(dir, 2)
    local rightRightRightMoverType = this.GetCell(dir, 2)
    if leftMoverType.name ~= "EMPTY" and rightMoverType.name ~= "EMPTY" and leftLeftMoverType.name ~= "EMPTY" and rightRightMoverType.name ~= "EMPTY" and leftLeftLeftMoverType.name ~= "EMPTY" and rightRightRightMoverType.name ~= "EMPTY" then
        this.Delete()
        this.EmitParticles(152, 0, 161)
        this.EmitParticles(152, 0, 161)
        this.PlaySound("cxmax_gembreak.wav")   
        return {true, false}
    end
    return this.Push(dir, bias)
end 
