name = "CX-Max Heavy Weight"
id = "CXMAX_HEAVYWEIGHT"
author = "traincrisis"
texture = "cxmax_heavyweight.png"
updateIndex = 9000

function Push(this, dir, bias)
    if bias >= 4 then
        return this.Push(dir, bias)
    else
        return {false, false}
    end
end

