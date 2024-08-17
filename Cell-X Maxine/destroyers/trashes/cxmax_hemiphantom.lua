name = "CX-Max Hemi-Phantom"
id = "CXMAX_HEMIPHANTOM"
author = "traincrisis"
texture = "cxmax_hemiphantom.png"
updateIndex = 21000

function Push(this, dir, bias)
    if (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
        -- Acts as a trash on top and front
        return {false, true}
    else
        -- Acts as a push on other sides
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

