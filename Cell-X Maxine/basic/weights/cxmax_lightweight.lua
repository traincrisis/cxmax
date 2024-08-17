name = "CX-Max Light Weight"
id = "CXMAX_LIGHTWEIGHT"
author = "traincrisis"
texture = "cxmax_lightweight.png"
updateIndex = 9000

function Push(this, dir, bias)
    if bias >= 1 then
        return this.Push(dir, bias)
    else
        return {false, false}
    end
end

