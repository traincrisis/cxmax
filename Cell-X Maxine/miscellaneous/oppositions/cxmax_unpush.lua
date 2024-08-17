name = "CX-Max Unpushable"
id = "CXMAX_UNPUSH"
author = "traincrisis"
texture = "cxmax_unpush.png" 
updateIndex = 9000

function Push(this, dir, bias)
    return {false, false}
end
