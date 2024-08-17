name = "CX-Max Life"
id = "CXMAX_LIFE"
author = "traincrisis"
texture = "cxmax_life.png"
updateIndex = 37000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Count alive neighbors (Life cells)
    local aliveNeighbors = 0
    local directions = {0, 1, 2, 3}  -- up, right, down, left

    for _, dir in ipairs(directions) do
        local neighbor = this.GetCell(dir, 1)
        if neighbor and neighbor.name == "CXMAX_LIFE" then
            aliveNeighbors = aliveNeighbors + 1
        end
    end

    -- Game of Life rules for the Life
    if aliveNeighbors < 2 or aliveNeighbors > 3 then
        -- Underpopulation or Overpopulation: Cell dies
        this.Delete()
    elseif aliveNeighbors == 2 or aliveNeighbors == 3 then
        -- Survival: Cell lives
        this.PlaySound("cxmax_life.wav")
    end

    -- Spread onto adjacent non-empty, non-life cells
    for _, dir in ipairs(directions) do
        local neighbor = this.GetCell(dir, 1)
        if neighbor and neighbor.name ~= "EMPTY" and neighbor.name ~= "CXMAX_LIFE" then
            neighbor.Delete()
            grid.CreateCell("CXMAX_LIFE", neighbor.x, neighbor.y, neighbor.direction)
        end
    end
end

