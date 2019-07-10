-- Uncomment the block that does what you want.

local no_talents = {0, 0, 0, 0, 0}
local current_career = Managers.player:local_player():career_name()
local talents = Managers.backend:get_interface("talents")

--[[ Only the current career ]]
--talents:set_talents(current_career, no_talents)

--[[ For ALL careers: ]]
--for career in pairs(CareerSettings) do talents:set_talents(career, no_talents) end
