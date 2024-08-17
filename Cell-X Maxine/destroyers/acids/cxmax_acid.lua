name = "CX-Max Acid"
id = "CXMAX_ACID"
author = "traincrisis"
texture = "cxmax_acid.png"
updateIndex = 16000

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
        targetCell.Delete()
        -- Delete the Acid cell
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

