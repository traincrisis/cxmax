name = "CX-Max Door"
id = "CXMAX_DOOR"
author = "traincrisis"
texture = "cxmax_door.png"
updateIndex = 24000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    return {false, false}  -- Door cannot be pushed
end
