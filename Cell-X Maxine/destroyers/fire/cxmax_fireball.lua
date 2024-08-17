name = "CX-Max Fireball"
id = "CXMAX_FIREBALL"
author = "traincrisis"
texture = "cxmax_fireball.png"
updateIndex = 24000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local directions = {0, 1, 2, 3}
    local moved = false

    -- Check if the cell ahead is empty
    local targetCell = this.GetCell(this.direction, 1)
    if targetCell and targetCell.name == "EMPTY" then
        -- Move (push) the Fireball forward in its direction
        this.Push(this.direction, 1)
        moved = true
    end

    -- If the Fireball did not move or if there is a non-empty cell ahead, turn into a Fire cell
    if not moved or (targetCell and targetCell.name ~= "EMPTY") then
        -- Replace the Fireball with a Fire cell at the current position
        this.Delete()
        this.PlaySound("cxmax_impact.wav")
        grid.CreateCell("CXMAX_FIRE", this.x, this.y, this.direction)
    end
end

