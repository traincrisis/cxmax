name = "CX-Max Sleepy Quasi-Enemy"
id = "CXMAX_SLEEPYQUASIENEMY"
author = "traincrisis & 4U70_DeadAuto"
texture = "cxmax_sleepyquasienemySLEEP.png"
updateIndex = 31000

local awake = false
local toAwaken = false

function Setup(this, x, y, rot, gen)
    grid.enemyCount = grid.enemyCount + 1
    this.ChangeTexture("cxmax_sleepyquasienemySLEEP.png")
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.ChangeTexture("cxmax_sleepyquasienemySLEEP.png")
    awake = false
    toAwaken = false
end

function Step(this)
    -- Check the 4 adjacent cells
    local directions = {0, 1, 2, 3}
    if toAwaken then
        awake = true
        this.ChangeTexture("cxmax_sleepyquasienemyAWAKE.png")
    end
    for _, dir in ipairs(directions) do
        local adjCell = this.GetCell(dir, 1)
        if adjCell and adjCell.name ~= "EMPTY" then
            toAwaken = true
            break
        end
    end
end

function Push(this, dir, bias)
    if dir == (this.direction + 2) % 4 then
        if not awake then
            grid.enemyCount = grid.enemyCount - 1
            this.EmitParticles(0, 0, 1)  -- Emit blue particles
            this.EmitParticles(0, 0, 1)
            this.PlaySound("cxmax_enemydeath.wav")
            this.Delete()
            return {false, true}
        else
            this.PlaySound("cxmax_celltrashed.wav")
            return {false, true}
        end
    else
        return this.Push(dir, bias)
    end
end

