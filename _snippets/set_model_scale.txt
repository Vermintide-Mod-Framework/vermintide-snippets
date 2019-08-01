---
title: Thicc Sienna (set a model's scale)
---

local SCALE_X, SCALE_Y, SCALE_Z = 1, 2, 1

local player = Managers.player:local_player()
Unit.set_local_scale(player.player_unit, 0, Vector3(SCALE_X, SCALE_Y, SCALE_Z))
