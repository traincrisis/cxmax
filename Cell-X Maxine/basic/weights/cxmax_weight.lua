name = "CX-Max Weight"
id = "CXMAX_WEIGHT"
author = "traincrisis"
texture = "cxmax_weight.png"
updateIndex = 9000

function Push(this, dir, bias)
    if bias >= 2 then
        return this.Push(dir, bias)
    else
        return {false, false}
    end
end

