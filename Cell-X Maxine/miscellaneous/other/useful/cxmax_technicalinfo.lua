name = "CX-Max Technical Info"
id = "CXMAX_TECHNICALINFO"
author = "traincrisis"
texture = "cxmax_technicalinfo.png"
updateIndex = 9000

function Step(this)
    if input.mouseX == this.x and input.mouseY == this.y and input.IsPressed("Mouse0") then
    -- Get the cell behind the Technical Cell
    local behind = this.GetCell(this.direction, -1)
     -- Print info about the cell behind
     print("ID: " .. behind.name)
     print("Direction: " .. behind.direction)
    end
end

