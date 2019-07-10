local world = Managers.world:world("level_world")
for _, unit in ipairs(World.units(world)) do	
    Unit.set_unit_visibility(unit, true)
end
