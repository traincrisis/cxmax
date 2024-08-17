name = "CX-Max Vertical Crab"
id = "CXMAX_VERTICALCRAB"
author = "traincrisis"
texture = "cxmax_verticalcrab.png"
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
    -- Only move if facing horizontal (left = 3, right = 1)
    if this.direction == 1 or this.direction == 3 then
        this.Push(this.direction, 1)
    end
end

