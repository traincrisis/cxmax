name = "CX-Max Super Key"
id = "CXMAX_SUPERKEY"
author = "traincrisis"
texture = "cxmax_superkey.png"
updateIndex = 25000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
    -- Key can be pushed
    return this.Push(dir, bias)
end

function Step(this)
    local doorCell = this.GetCell(this.direction, 1)  -- Check for a Door cell ahead

    -- If the cell ahead is a Door, destroy both the Key and the Door
    if doorCell and doorCell.name == "CXMAX_DOOR" then
        this.PlaySound("cxmax_doorunlocked.wav")
        this.PlaySound("cxmax_enemydeath.wav")
        doorCell.Delete()
        this.EmitParticles(0.887,0,0)
        this.EmitParticles(0.478,0,0)
    end
end

