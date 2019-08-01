---
title: Make all units visible
---

-- NOTE: Only has an effect on units _currently_ on the world.
local world = Managers.world:world("level_world")
for _, unit in ipairs(World.units(world)) do
    Unit.set_unit_visibility(unit, true)
end
