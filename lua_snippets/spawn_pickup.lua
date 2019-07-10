local PICKUP_NAME = "healing_draught"

local pickup_settings = rawget(AllPickups, PICKUP_NAME)
if not pickup_settings then
    return mod:echo("Valid pickups: %s", table.concat(table.keys(AllPickups), ", "))
end
local player = Managers.player:local_player()
local unit = player.player_unit
local position = Unit.local_position(unit, 0)
local rotation = Unit.local_rotation(unit, 0)
local v_zero = Vector3.zero()
local extension_init_data = {
    projectile_locomotion_system = {
        network_position = AiAnimUtils.position_network_scale(position, true),
        network_rotation = AiAnimUtils.rotation_network_scale(rotation, true),
        network_velocity = v_zero,
        network_angular_velocity = v_zero,
    },
    pickup_system = {
        pickup_name = PICKUP_NAME,
        spawn_type = "dropped",
        has_physics = true,
    },
}
Managers.state.unit_spawner:spawn_network_unit(pickup_settings.unit_name, "pickup_unit", extension_init_data, position, rotation)
