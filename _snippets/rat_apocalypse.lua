---
title: A critter_rat Tale: Innocence
layout: snippet
---

local BREED_NAME = "critter_rat"
local BREED_COUNT = 5

local sin, cos, pi2 = math.sin, math.cos, 2*math.pi

local function spawn_unit(pos, rot)
    Managers.state.conflict:spawn_queued_unit(Breeds[BREED_NAME],
        Vector3Box(pos), QuaternionBox(rot), "misc", nil, nil)
end

mod:hook_safe(ConflictDirector, "register_unit_killed", function(self, killed_unit)
    local blackboard = BLACKBOARDS[killed_unit]
    local nav_world = Managers.state.entity:system("ai_system"):nav_world()

    local position = POSITION_LOOKUP[killed_unit]
    local rotation = Unit.local_rotation(killed_unit, 0)
    local forward = Quaternion.forward(rotation)
    local right = Quaternion.right(rotation)

    AiUtils.generic_mutator_explosion(killed_unit, blackboard, "generic_mutator_explosion")

    for i=0, BREED_COUNT-1 do
        local ang = i/BREED_COUNT*pi2
        local pos = position + forward*cos(ang) + right*sin(ang)
        local ppos = LocomotionUtils.pos_on_mesh(nav_world, pos, 1, 1)
        if not ppos then
            ppos = GwNavQueries.inside_position_from_outside_position(nav_world, pos, 6, 6, 8, 0.5)
        end
        if ppos then
            local rot = Quaternion.multiply(Quaternion.axis_angle(Vector3.up(), ang), rotation)
            spawn_unit(ppos, rot)
        end
    end
end)
