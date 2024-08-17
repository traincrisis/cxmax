name = "CX-Max Generatable Wall"
id = "CXMAX_GENERATABLEWALL"
author = "traincrisis"
texture = "cxmax_generatablewall.png" 
updateIndex = 9000

function Setup (this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    return {false, false}
end

function Rotate(this, amount) end
