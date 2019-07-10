local SOUND_EVENT_NAME = "pwe_activate_ability_handmaiden_03"

local world = Managers.world:world("level_world")
local wwise_world = Managers.world:wwise_world(world)
WwiseWorld.trigger_event(wwise_world, event)
