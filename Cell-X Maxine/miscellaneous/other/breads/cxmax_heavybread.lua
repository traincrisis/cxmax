name = "CX-Max Heavy Bread"
id = "CXMAX_HEAVYBREAD"
author = "traincrisis"
texture = "cxmax_heavybread.png"
updateIndex = 28000

function Push(this, dir, bias)
    -- Check if the Heavy Bread cell is pushed with a bias of 4 or more
    if bias >= 4 then
        -- Destroy the Heavy Bread cell
        this.Delete()
        
        -- Emit particles and play sound on destruction
        this.EmitParticles(0.9, 0.79, 0.556)
        this.EmitParticles(0.9, 0.79, 0.556)
        this.PlaySound("cxmax_enemydeath.wav")
        
        -- Return {false, true} to indicate the cell is destroyed and no further push is possible
        return {false, true}
    else
        -- If the bias is less than 4, the Heavy Bread cell remains intact
        return {false, false}
    end
end

