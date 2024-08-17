name = "CX-Max Diamond"
id = "CXMAX_DIAMOND"
author = "traincrisis"
texture = "cxmax_diamond.png"
updateIndex = 25000

function Push(this, dir, bias)
    local leftMoverType = this.GetCell(dir, -1)
    local rightMoverType = this.GetCell(dir, 1)
    if leftMoverType.name ~= "EMPTY" and rightMoverType.name ~= "EMPTY" then
        this.Delete()
        this.EmitParticles(0, 255, 255)
        this.EmitParticles(0, 255, 255)
        this.PlaySound("cxmax_gembreak.wav")   
        return {true, false}
    end
    return this.Push(dir, bias)
end 
