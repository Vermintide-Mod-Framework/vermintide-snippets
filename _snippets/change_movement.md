---
title: Set the player's movespeed
---

local WANTED_SPEED = 8 -- default is 4

PlayerUnitMovementSettings.move_speed = WANTED_SPEED

local _, units_player_movement_setting = debug.getupvalue(PlayerUnitMovementSettings.unregister_unit, 1)
if not units_player_movement_setting then return end
for _, settings in pairs(units_player_movement_setting) do
    settings.move_speed = WANTED_SPEED
end
