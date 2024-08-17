name = "CX-Max Mover"
id = "CXMAX_PUSHER"
author = "traincrisis"
texture = "cxmax_pusher.png"
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
    this.Push(this.direction, 1)
end
