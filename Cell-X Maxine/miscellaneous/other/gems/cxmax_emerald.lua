name = "CX-Max Emerald"
id = "CXMAX_EMERALD"
author = "traincrisis"
texture = "cxmax_emerald.png"
updateIndex = 25000

function Push(this, dir, bias)
    local leftMoverType = this.GetCell(dir, -1)
    local leftLeftMoverType = this.GetCell(dir, -2)
    local rightMoverType = this.GetCell(dir, 1)
    local rightRightMoverType = this.GetCell(dir, 2)
    if leftMoverType.name ~= "EMPTY" and rightMoverType.name ~= "EMPTY" and leftLeftMoverType.name ~= "EMPTY" and rightRightMoverType.name ~= "EMPTY" then
        this.Delete()
        this.EmitParticles(0, 128, 0)
        this.EmitParticles(0, 94, 0)
        this.PlaySound("cxmax_gembreak.wav")   
        return {true, false}
    end
    return this.Push(dir, bias)
end 
