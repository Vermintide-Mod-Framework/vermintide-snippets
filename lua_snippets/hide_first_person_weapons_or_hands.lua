local HIDE_FIRST_PERSON_WEAPONS = false
local HIDE_FIRST_PERSON_HANDS = true

mod:pcall(function()
	local unit = Managers.player:local_player().player_unit
	local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	
	-- hide/unhide weapons
	if HIDE_FIRST_PERSON_WEAPONS then
		first_person_extension:hide_weapons("hide_weapons_snippet", true)
	else
		first_person_extension:unhide_weapons("hide_weapons_snippet")
	end
	
	-- hide/unhide hands
	Unit.set_unit_visibility(first_person_extension.first_person_attachment_unit, not HIDE_FIRST_PERSON_HANDS)
end)
