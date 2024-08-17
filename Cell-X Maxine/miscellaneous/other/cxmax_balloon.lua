name = "CX-Max Balloon"
id = "CXMAX_BALLOON"
author = "traincrisis"
texture = "cxmax_balloon.png"
updateIndex = 25000

-- Array of wall types that will cause the Balloon to delete itself
local wallTypes = {
    ["CXMAX_WALL"] = true,
    ["CXMAX_GHOSTWALL"] = true,
    ["CXMAX_GENERATABLEWALL"] = true,
    ["CXMAX_ROTATABLEWALL"] = true,
    ["CXMAX_DOOR"] = true
}

function Push(this, dir, bias)

    -- Check if the cell was pushed into a wall
    local nextCell = this.GetCell(dir, 1)
    if nextCell and wallTypes[nextCell.name] then
        -- Destroy the Balloon cell if pushed into a wall type listed
        this.Delete()
        this.EmitParticles(0.887,0,0)
        this.EmitParticles(0.478,0,0)
        this.PlaySound("cxmax_balloonpop.wav")   
        return {true, false}
    end

    return this.Push(dir, bias)
end

