local WANTED_WAVE = 1

-- Needed to avoid a crash. Removes an assert that would fail otherwise.
mod:hook_origin(SpawnManager, "set_respawning_enabled", function(self, enabled)
    self._respawns_enabled = enabled
end)

if (num < 1 or num > 7) then
    return mod:error("You must specify a wave number in the range [1,7].")
end

local level_key = Managers.state.game_mode:level_key()
if level_key ~= "plaza" then
    return mod:error("You must be inside Fortunes of War to use this command.")
end

local conflict_manager = Managers.state.conflict
mod:pcall(conflict_manager.start_terror_event, conflict_manager, "plaza_wave_" .. num)
mod:echo("Started wave %i (Fortunes of War)", num)
