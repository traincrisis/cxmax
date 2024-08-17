name = "CX-Max Push Wall"
id = "CXMAX_PUSHWALL"
author = "traincrisis"
texture = "cxmax_pushwall.png" 
updateIndex = 9000

function Setup (this, x, y, rot, gen)
    if gen then
        this.Delete()
        return {true, false}
    end
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    return this.Push(dir, bias)
end

function Rotate(this, amount) end
