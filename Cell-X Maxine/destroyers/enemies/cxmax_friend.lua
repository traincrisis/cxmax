name = "CX-Max Friend"
id = "CXMAX_FRIEND"
author = "traincrisis"
texture = "cxmax_friend.png"
updateIndex = 18000

function Setup(this, x, y, rot, gen)
    -- Set up the Friend cell
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    -- When the Friend cell is pushed, it behaves like an enemy but without the enemy tag
    grid.enemyCount = 9999 -- Set the number of enemies to 9999, making the level impossible
    this.PlaySound("cxmax_enemydeath.wav")
    this.Delete()
    this.EmitParticles(0, 255, 255) -- Neutral color for particles
    this.EmitParticles(0, 255, 255) -- Neutral color for particles
    return {false, true}
end

