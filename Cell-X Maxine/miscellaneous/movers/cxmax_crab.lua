name = "CX-Max Crab"
id = "CXMAX_CRAB"
author = "traincrisis"
texture = "cxmax_crab.png"
updateIndex = 9000

function Push(this, dir, bias)
    if (this.rotation == dir) then
        bias = bias + 1
    elseif ((dir + 2) % 4 == this.rotation) then
        bias = bias - 1
    end
    return this.Push(dir, bias)
end

function Step(this)
    -- Only move if facing horizontal (left = 2, right = 0)
    if this.direction == 2 or this.direction == 0 then
        this.Push(this.direction, 1)
    end
end

