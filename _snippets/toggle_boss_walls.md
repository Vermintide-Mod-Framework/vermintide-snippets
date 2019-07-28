---
title: Toggle boss walls
requested_by: NeZCheese
---

local WANTED_STATE = "lua_open" -- can also be: lua_close
local BOSS_WALL_FX = "lua_closed_stormfiend" -- can also be: lua_closed_troll

-- Get ahold of the boss door units.
local state_entity = Managers.state.entity
local door_system = state_entity and state_entity:system("door_system")
local boss_door_units = door_system and door_system:get_boss_door_units()
if boss_door_units then
    for i, door_unit in ipairs(boss_door_units) do
        Unit.flow_event(door_unit, WANTED_STATE)
        Unit.flow_event(door_unit, BOSS_WALL_FX)
    end
end
