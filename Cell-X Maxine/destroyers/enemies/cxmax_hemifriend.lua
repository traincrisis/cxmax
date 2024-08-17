name = "CX-Max Hemi-Friend"
id = "CXMAX_HEMIFRIEND"
author = "traincrisis"
texture = "cxmax_hemifriend.png"
updateIndex = 17000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    if (dir == (this.direction + 2)%4 or dir == (this.direction + 1)%4) then
    -- When the Friend cell is pushed, it behaves like an enemy but without the enemy tag
    grid.enemyCount = 9999 -- Set the number of enemies to 9999, making the level impossible
    this.PlaySound("cxmax_enemydeath.wav")
    this.Delete()
    this.EmitParticles(0, 255, 255) -- Neutral color for particles
    return {false, true}
        return {false, true}
    else
        return this.Push(dir, bias)
    end
end

