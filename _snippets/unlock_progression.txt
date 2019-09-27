---
title: Unlock all difficulties, trinket slots and crafting
vt1: true
---

mod:hook(LevelUnlockUtils, "unlocked_level_difficulty_index", function()
    return 5
end)
mod:hook(ProgressionUnlocks, "is_unlocked", function()
    return true
end)
