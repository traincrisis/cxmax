name = "CX-Max Quasi-Phantom"
id = "CXMAX_QUASIPHANTOM"
author = "traincrisis"
texture = "cxmax_quasiphantom.png"
updateIndex = 20000

function Push(this, dir, bias)
    if dir == (this.direction + 2)%4 then
        -- Acts as a trash on the front
        return {false, true}
    else
        -- Acts as a push on all other directions
        return this.Push(dir, bias)
    end
end

function Setup(this, x, y, rot, gen)
    if gen then
        this.Delete()
        return {false, true}
    end
    -- Normal setup behavior
    this.Setup(x, y, rot, gen)
end

