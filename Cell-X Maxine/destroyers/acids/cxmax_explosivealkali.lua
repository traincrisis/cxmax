name = "CX-Max Explosive Alkali"
id = "CXMAX_EXPALKALI"
author = "traincrisis"
texture = "cxmax_explosivealkali.png"
updateIndex = 19000

function Setup(this, x, y, rot, gen)
    this.Setup(x, y, rot, gen)
end

function Step(this)
    -- Move in the current direction
    local moveResult = this.Push(this.direction, 1)
    
    -- Check if the Alkali moved and collides with a cell
    if moveResult[1] then
        local targetCell = this.GetCell(this.direction, 1)
        
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

        -- Destroy the target cell if it is not blacklisted
        if targetCell and targetCell.name ~= "EMPTY" and not blacklist[targetCell.name] then
            this.PlaySound("cxmax_enemydeath.wav")
            targetCell.Delete()
            
            -- Destroy adjacent cells
            local directions = {0, 1, 2, 3}
            for _, dir in ipairs(directions) do
                local adjCell = this.GetCell(dir, 1)
                if adjCell and adjCell.name ~= "EMPTY" and not blacklist[adjCell.name] then
                    adjCell.Delete()
                end
            end

            -- Destroy the Explosive Alkali itself
            this.Delete()
            this.EmitParticles(0, 128, 0)
            this.EmitParticles(0, 94, 0)
        end
    end
end

