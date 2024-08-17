name = "CX-Max Ultra Heavy Weight"
id = "CXMAX_ULTRAHEAVYWEIGHT"
author = "traincrisis"
texture = "cxmax_ultraheavyweight.png"
updateIndex = 9000

function Push(this, dir, bias)
    if bias >= 6 then
        return this.Push(dir, bias)
    else
        return {false, false}
    end
end

