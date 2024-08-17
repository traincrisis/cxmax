name = "CX-Max Semi-Phantom"
id = "CXMAX_SEMIPHANTOM"
author = "traincrisis"
texture = "cxmax_semiphantom.png"
updateIndex = 19000

function Push(this, dir, bias)
    if (dir == this.direction or dir == (this.direction + 2) % 4) then
        -- Acts as a trash on the sides
        return {false, true}
    else
        -- Acts as a push on top and bottom
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

