---
title: Discount Deathwish
---

```lua
local DAMAGE_DEALT_MULTIPLIER = 2/3 -- Reduce damage taken by enemies by 33%
local DAMAGE_RECV_MULTIPLIER = 1.5 -- Increase damage taken by players by 33%

local is_player_unit = DamageUtils.is_player_unit
local is_enemy_unit = function(unit) return Unit.get_data(unit, "breed") end
mod:hook(DamageUtils, "add_damage_network", function(func, attacked_unit, attacker_unit, damage_amount, ...)
    if is_enemy_unit(attacked_unit) then
        damage_amount = damage_amount * DAMAGE_DEALT_MULTIPLIER
    elseif is_player_unit(attacked_unit) then
        damage_amount = damage_amount * DAMAGE_RECV_MULTIPLIER
    end
    return func(attacked_unit, attacker_unit, damage_amount, ...)
end)
```
