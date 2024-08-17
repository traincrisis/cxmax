name = "CX-Max Bread"
id = "CXMAX_BREAD"
author = "traincrisis"
texture = "cxmax_bread.png"
updateIndex = 27000

function Push(this, dir, bias)
    -- Check if the Bread cell is destroyed
    if bias >= 2 then
        this.Delete()
        this.EmitParticles(0.9, 0.79, 0.556)
        this.EmitParticles(0.9, 0.79, 0.556)
        this.PlaySound("cxmax_enemydeath.wav")
        return {false, true}     
    else
        return {false, false}
    end
end

