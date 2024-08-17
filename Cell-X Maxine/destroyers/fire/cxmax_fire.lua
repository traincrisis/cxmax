name = "CX-Max Fire"
id = "CXMAX_FIRE"
author = "traincrisis"
texture = "cxmax_fire.png"
updateIndex = 23000

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
        if targetCell and targetCell.name ~= "EMPTY" and not blacklist[targetCell.name] then
            -- Delete the cell before spreading Fire
            targetCell.Delete()
            
            -- Spread Fire to the target cell
            if targetCell.name ~= this.name then
                grid.CreateCell(this.name, targetCell.x, targetCell.y, dir)
                spread = true
            end
        end
    end

    -- If Fire did not spread, delete itself
    if not spread then
        this.Delete()
    end
end

