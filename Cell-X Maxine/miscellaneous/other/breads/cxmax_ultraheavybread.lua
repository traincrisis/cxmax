name = "CX-Max Ultra Heavy Bread"
id = "CXMAX_ULTRAHEAVYBREAD"
author = "traincrisis"
texture = "cxmax_ultraheavybread.png"
updateIndex = 29000

function Push(this, dir, bias)
    -- Check if the Ultra Heavy Bread cell is pushed with a bias of 6 or more
    if bias >= 6 then
        -- Destroy the Ultra Heavy Bread cell
        this.Delete()
        
        -- Emit multiple particles and play sound on destruction
        this.EmitParticles(0.9, 0.79, 0.556)
        this.EmitParticles(0.9, 0.79, 0.556)
        this.PlaySound("cxmax_enemydeath.wav")
        
        -- Return {false, true} to indicate the cell is destroyed and no further push is possible
        return {false, true}
    else
        -- If the bias is less than 6, the Ultra Heavy Bread cell remains intact
        return {false, false}
    end
end

