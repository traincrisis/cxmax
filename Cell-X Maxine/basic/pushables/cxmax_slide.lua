name = "CX-Max Slide"
id = "CXMAX_SLIDE"
author = "traincrisis"
texture = "cxmax_slide.png" 
updateIndex = 9000

function Push(this, dir, bias)
    if not (dir == this.direction or dir == (this.direction + 2)%4) then
        return {false, false}
    else
        return this.Push(dir, bias)
    end
end
