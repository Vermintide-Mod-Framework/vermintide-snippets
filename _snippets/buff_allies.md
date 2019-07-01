---
title: Give allies a buff (VT1 only)
---

```lua
local buff_template = "speed_boost_potion"

local buff_template_name_id = NetworkLookup.buff_templates[buff_template]
if not buff_template_name_id then
    mod:echo("Cannot synchronize buff `%s`", buff_template)
    return
end

-- Grab network managers.
local network_manager = Managers.state.network
local network_transmit = network_manager.network_transmit

-- Find the game object id of the local player unit.
local local_player_unit = Managers.player:local_player().player_unit
local local_player_go_id = network_manager:unit_game_object_id(local_player_unit)

-- Add buff to self.
local buff_extension = ScriptUnit.extension(local_player_unit, "buff_system")
buff_extension:add_buff(buff_template)

-- Iterate through all bots and players.
local player_and_bot_units = PLAYER_AND_BOT_UNITS
for i = 1, #player_and_bot_units, 1 do
    -- Find the game object id of their player.
    local other_player_unit = player_and_bot_units[i]
    if other_player_unit ~= local_player_unit then
        local other_player_go_id = network_manager:unit_game_object_id(other_player_unit)

        -- Give them the buff.
        if Managers.player.is_server then
            network_transmit:send_rpc_clients("rpc_add_buff", other_player_go_id, buff_template_name_id, local_player_go_id)
        else
            network_transmit:send_rpc_server("rpc_add_buff", other_player_go_id, buff_template_name_id, local_player_go_id)
        end
    end
end
```
