name = "CX-Max Ghost Wall"
id = "CXMAX_GHOSTWALL"
author = "traincrisis"
texture = "cxmax_ghostwall.png" 
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

function Rotate(this, amount) end
