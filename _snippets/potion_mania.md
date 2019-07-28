---
title: Potion Mania
---

```lua
local SCALE = 10/3
local LIFT_CURSE_ON_DEATH = true
local ATTACHMENT_NODE = "j_spine"
local function UNIT_SELECTOR(unit)
    local blackboard = BLACKBOARDS[unit]
    local breed = blackboard and blackboard.breed
    if breed and breed.boss then return "units/weapons/player/pup_potion_01/pup_potion_strenght_01"
    elseif breed and breed.special then return "units/weapons/player/pup_potion_01/pup_potion_speed_01"
    else return "units/weapons/player/pup_potion_01/pup_potion_extra_01"
    end
    --return "units/beings/player/way_watcher/third_person_base/chr_third_person_base"
end

local unit_dict = mod:persistent_table("unit_dict")
local Unit, World, Vector3, Quaternion, Matrix4x4 = Unit, World, Vector3, Quaternion, Matrix4x4
local function spawn(_, unit)
    --if not Unit.alive(unit) then return end
    local u_pose, u_size = Unit.box(unit, true)
    local world = Managers.world:world("level_world")
    local child = World.spawn_unit(world, UNIT_SELECTOR(unit), Vector3.zero(), Quaternion.identity())
    unit_dict[unit] = child
    local ok, node = pcall(Unit.node, unit, ATTACHMENT_NODE)
    node = ok and node or 0
    World.link_unit(world, child, unit, node)
    local pose = Unit.world_pose(unit, node)
    Unit.set_local_pose(child, 0, Matrix4x4.multiply(u_pose, Matrix4x4.inverse(pose)))
    Unit.set_local_scale(child, 0, SCALE*u_size)
    Unit.set_unit_visibility(unit, false)
    return child
end
local function remove(_, unit)
    local child = unit_dict[unit]
    if not child then return end
    unit_dict[unit] = nil
    if Unit.alive(child) then
        local world = Managers.world:world("level_world")
        World.destroy_unit(world, child)
    end
    if LIFT_CURSE_ON_DEATH and Unit.alive(unit) then
        AiUtils.generic_mutator_explosion(unit, BLACKBOARDS[unit], "generic_mutator_explosion")
        Unit.set_unit_visibility(unit, true)
    end
end
mod:hook_safe(ConflictDirector, "_post_spawn_unit", spawn)
mod:hook_safe(ConflictDirector, "register_unit_destroyed", spawn)
mod:hook_safe(ConflictDirector, "register_unit_killed", remove)
mod:hook(PickupSystem, "_spawn_pickup", function(func, self, pickup_settings, pickup_name, ...)
    return func(self, AllPickups.cooldown_reduction_potion, "cooldown_reduction_potion", ...)
end)
```
