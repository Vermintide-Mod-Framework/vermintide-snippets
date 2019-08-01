---
title: Hammertime!
requested_by: dieaready
---

local MULTIPLIER = 10

for _, settings in pairs(Breeds) do
    local base_push = settings._base_scale_death_push or settings.scale_death_push
    settings._base_scale_death_push = base_push
    if base_push then
        settings.scale_death_push = MULTIPLIER * base_push
    end
end
