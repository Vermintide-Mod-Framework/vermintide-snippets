---
title: Set game timescale
---

```lua
local WANTED_TIMESCALE_PERCENT = 200 -- twice the normal speed

local time_scale_list = Managers.state.debug.time_scale_list
for i=1, #time_scale_list do
    if time_scale_list[i] >= scale then
        mod:echo("Timescale set to x%g", time_scale_list[i]*0.01)
        return Managers.state.debug:set_time_scale(i)
    end
end
```
