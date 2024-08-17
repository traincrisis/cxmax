name = "CX-Max Rotatable Wall"
id = "CXMAX_ROTATABLEWALL"
author = "traincrisis"
texture = "cxmax_rotatablewall.png" 
updateIndex = 9000

function Setup (this, x, y, rot, gen)
    if gen then
        this.Delete()
    end
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    return {false, false}
end
