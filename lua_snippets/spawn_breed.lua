local WANTED_BREED = "skaven_storm_vermin_warlord" -- Skarrik Spinemanglr

if not rawget(Breeds, WANTED_BREED) then
  mod:error("No such breed: %s", WANTED_BREED)
  local valid_breeds = {}
  mod:echo("All breeds: %s", table.concat(table.keys(Breeds), ", "))
  return
end
local conflict_director = Managers.state.conflict
conflict_director._debug_breed = WANTED_BREED
conflict_director:debug_spawn_breed(0)
