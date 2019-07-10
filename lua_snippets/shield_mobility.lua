local DODGE_COUNT               = 2 -- Default: 1
local MULTIPLIER_DODGE_DISTANCE = 1 -- Default: 0.85
local MULTIPLIER_DODGE_SPEED    = 1 -- Default: 0.85

for _, template_name in ipairs{ 
    "one_hand_axe_shield_template_1",
    "one_handed_sword_shield_template_1",
    "one_handed_hammer_shield_template_1",
    "one_handed_hammer_shield_template_2",
} do
    local weapon_template = Weapons[template_name]
    weapon_template.dodge_count = DODGE_COUNT
    weapon_template.buffs = {
        change_dodge_distance = { external_optional_multiplier = MULTIPLIER_DODGE_DISTANCE },
        change_dodge_speed    = { external_optional_multiplier = MULTIPLIER_DODGE_SPEED },
    }
end
