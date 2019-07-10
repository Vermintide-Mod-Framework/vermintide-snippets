local AOE_SIZE_MULTIPLIER = 1.5

local action_two_default = Weapons.staff_fireball_geiser_template_1.actions.action_two.default
action_two_default.min_radius = 0.75 * AOE_SIZE_MULTIPLIER
action_two_default.max_radius = 3.5  * AOE_SIZE_MULTIPLIER
