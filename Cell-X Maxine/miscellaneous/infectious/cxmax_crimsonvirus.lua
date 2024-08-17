name = "CX-Max Crimson Virus"
id = "CXMAX_CRIMSONVIRUS"
author = "traincrisis"
texture = "cxmax_crimsonvirus.png"
updateIndex = 24000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    local directions = {0, 1, 2, 3}
    local spread = false

    local blacklist = {
        ["CXMAX_WALL"] = true,
        ["CXMAX_GHOSTWALL"] = true,
        ["CXMAX_GENERATABLEWALL"] = true,
        ["CXMAX_ROTATABLEWALL"] = true,
        ["CXMAX_TRASH"] = true,
        ["CXMAX_SEMITRASH"] = true,
        ["CXMAX_QUASITRASH"] = true,
        ["CXMAX_HEMITRASH"] = true,
        ["CXMAX_PHANTOM"] = true,
        ["CXMAX_SEMIPHANTOM"] = true,
        ["CXMAX_QUASIPHANTOM"] = true,
        ["CXMAX_HEMIPHANTOM"] = true
    }

    for _, dir in ipairs(directions) do
        local targetCell = this.GetCell(dir, 1)
        
        if targetCell and targetCell.name ~= "EMPTY" and targetCell.name ~= this.name and not blacklist[targetCell.name] then
            -- Delete the cell at the target position
            targetCell.Delete()
            
            -- Create a new Crimson Virus cell at the target position
            grid.CreateCell(this.name, targetCell.x, targetCell.y, this.direction)
            spread = true
        end
    end
    
    -- The Crimson Virus does not delete itself, even if it did not spread
end

