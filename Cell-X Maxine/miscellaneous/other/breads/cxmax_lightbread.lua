name = "CX-Max Light Bread"
id = "CXMAX_LIGHTBREAD"
author = "traincrisis"
texture = "cxmax_lightbread.png"
updateIndex = 30000

function Push(this, dir, bias)
    -- Check if the Light Bread cell is pushed with a bias of 1 or more
    if bias >= 1 then
        -- Destroy the Light Bread cell
        this.Delete()
        
        -- Emit particles and play sound on destruction
        this.EmitParticles(1.0, 0.9, 0.5)
        this.EmitParticles(1.0, 0.9, 0.5)
        this.PlaySound("cxmax_enemydeath.wav")
        
        -- Return {false, true} to indicate the cell is destroyed and no further push is possible
        return {false, true}
    else
        -- If the bias is less than 1, the Light Bread cell remains intact
        return {false, false}
    end
end

