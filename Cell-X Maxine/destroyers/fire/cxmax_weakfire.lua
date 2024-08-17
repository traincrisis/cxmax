name = "CX-Max Weak Fire"
id = "CXMAX_WEAKFIRE"
author = "traincrisis"
texture = "cxmax_weakfire.png"
updateIndex = 25000

function Start(this)
    spreadCount = 4  -- Initialize the spread count to 4
end

function Setup(this, x, y, rot, gen)
    spreadCount = 4  -- Initialize the spread count to 4
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
        if spreadCount > 0 then
            local targetCell = this.GetCell(dir, 1)
            if targetCell and targetCell.name ~= "EMPTY" and not blacklist[targetCell.name] then
                -- Delete the cell before spreading Weak Fire
                targetCell.Delete()
                
                -- Spread Weak Fire to the target cell
                if targetCell.name ~= this.name then
                    grid.CreateCell(this.name, targetCell.x, targetCell.y, dir)
                    spread = true
                    spreadCount = spreadCount - 1  -- Decrease the spread count by 1
                end
            end
        end
    end

    -- If Weak Fire did not spread or spreadCount is depleted, delete itself
    if not spread or spreadCount <= 0 then
        this.Delete()
    end
end

