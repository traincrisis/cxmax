name = "CX-Max Move or Die"
id = "CXMAX_PUSHORDIE"
author = "traincrisis"
texture = "cxmax_pushordie.png"
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
    local canPush = this.Push(this.direction, 1)
    if not canPush[1] then
        this.Delete()
    end
end
