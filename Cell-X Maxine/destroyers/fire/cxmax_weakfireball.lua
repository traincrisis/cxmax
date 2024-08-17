name = "CX-Max Weak Fireball"
id = "CXMAX_WEAKFIREBALL"
author = "traincrisis"
texture = "cxmax_weakfireball.png"
updateIndex = 26000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local moved = false

    -- Check if the cell ahead is empty
    local targetCell = this.GetCell(this.direction, 1)
    if targetCell and targetCell.name == "EMPTY" then
        -- Move (push) the Weak Fireball forward in its direction
        this.Push(this.direction, 1)
        moved = true
    end

    -- If the Weak Fireball did not move or if there is a non-empty cell ahead, turn into a Weak Fire cell
    if not moved or (targetCell and targetCell.name ~= "EMPTY") then
        -- Replace the Weak Fireball with a Weak Fire cell at the current position
        this.Delete()
        this.PlaySound("cxmax_impact.wav")
        grid.CreateCell("CXMAX_WEAKFIRE", this.x, this.y, this.direction)
    end
end

