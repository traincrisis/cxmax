name = "CX-Max Explosive Acid"
id = "CXMAX_EXPLOSIVEACID"
author = "traincrisis"
texture = "cxmax_explosiveacid.png"
updateIndex = 17000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Push(this, dir, bias)
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

    local targetCell = this.GetCell(dir, 1)
    
    -- Check if the cell can be pushed and is not in the blacklist
    if targetCell and targetCell.name ~= "EMPTY" and not blacklist[targetCell.name] then
        -- Play destruction sound
        this.PlaySound("cxmax_enemydeath.wav")

        -- Destroy the target cell
        targetCell.Delete()

        -- Destroy adjacent cells
        local adjacentDirs = {0, 1, 2, 3}
        for _, adjDir in ipairs(adjacentDirs) do
            local adjacentCell = this.GetCell(adjDir, 1)
            if adjacentCell and adjacentCell.name ~= "EMPTY" and not blacklist[adjacentCell.name] then
                adjacentCell.Delete()
            end
        end

        -- Delete the Explosive Acid cell
        this.Delete()

        -- Emit particles for visual effect
        this.EmitParticles(0, 128, 0)
        this.EmitParticles(0, 94, 0)
        -- Return values to indicate the cell was destroyed
        return {true, false}
    else
        -- Return values to indicate the cell was not destroyed
        return this.Push(dir, bias)
    end
end

