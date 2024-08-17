name = "CX-Max Cracker"
id = "CXMAX_CRACKER"
author = "traincrisis"
texture = "cxmax_cracker.png"
updateIndex = 36000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Start(this)
    this.data.storedCell = "EMPTY"
    this.data.storedCellRot = 0
end

function Push(this, dir, bias)
    local pushedCell = this.GetCell(dir, -1)

    if this.data.storedCell ~= "EMPTY" then
        -- Destroy the pushed cell
        if pushedCell and pushedCell.name ~= "EMPTY" then
            pushedCell.Delete()

            -- Destroy the Cracker itself
            this.PlaySound("cxmax_enemydeath.wav")
            this.EmitParticles(150, 75, 0)
            this.EmitParticles(150, 75, 0)
            this.Delete()

            -- Spawn the stored cell at the Cracker's position
            grid.CreateCell(this.data.storedCell, this.x, this.y, this.data.storedCellRot)
        end
    elseif pushedCell and pushedCell.name ~= "EMPTY" then
        -- Store the pushed cell and delete it
        this.data.storedCell = pushedCell.name
        this.data.storedCellRot = pushedCell.direction
        pushedCell.Delete()
    end

    -- No pushing occurs
    return {false, false}
end

