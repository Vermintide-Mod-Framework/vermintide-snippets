---
title: Headshot-only mode
---

```lua
mod:hook(DamageUtils, "calculate_damage", function(func, damage_output, target_unit, attacker_unit, hit_zone_name, ...)
    if hit_zone_name ~= "head" then return 0 end
    return func(damage_output, target_unit, attacker_unit, hit_zone_name, ...)
end)
```
