name = "CX-Max Phantom"
id = "CXMAX_PHANTOM"
author = "traincrisis"
texture = "cxmax_phantom.png"
updateIndex = 18000

function Push(this, dir, bias)
    -- Phantom cell is treated like a trash but makes no sound and is ungeneratable
    return {false, true}
end

function Setup(this, x, y, rot, gen)
    if gen then
        this.Delete()
        return {false, true}
    end
    this.Setup(x, y, rot, gen)
end

