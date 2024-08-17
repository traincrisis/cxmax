name = "CX-Max Cancer Virus"
id = "CXMAX_CANCERVIRUS"
author = "traincrisis"
texture = "cxmax_cancervirus.png"
updateIndex = 25000

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
        ["CXMAX_HEMIPHANTOM"] = true,
        ["CXMAX_CANCERVIRUS"] = true,  -- Prevents spreading onto itself
        ["CXMAX_CANCERGENERATOR"] = true
    }

    for _, dir in ipairs(directions) do
        local targetCell = this.GetCell(dir, 1)
        
        if targetCell and (targetCell.name == "EMPTY" or not blacklist[targetCell.name]) then
            -- Delete the target cell before spreading
            targetCell.Delete()
            
            -- Create a new Cancer Virus cell at the target position
            grid.CreateCell(this.name, targetCell.x, targetCell.y, dir)
            spread = true
        end
    end
    
    -- The Cancer Virus does not delete itself, even if it did not spread
end

