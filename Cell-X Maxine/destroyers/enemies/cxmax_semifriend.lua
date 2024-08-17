name = "CX-Max Semi-Friend"
id = "CXMAX_SEMIFRIEND"
author = "traincrisis"
texture = "cxmax_semifriend.png"
updateIndex = 15000

function Push(this, dir, bias)
    if (dir == this.direction or dir == (this.direction + 2)%4) then
    -- When the Friend cell is pushed, it behaves like an enemy but without the enemy tag
    grid.enemyCount = 9999 -- Set the number of enemies to 9999, making the level impossible
    this.PlaySound("cxmax_enemydeath.wav")
    this.Delete()
    this.EmitParticles(0, 255, 255) -- Neutral color for particles
    return {false, true}
    else
        return this.Push(dir, bias)
    end
end
