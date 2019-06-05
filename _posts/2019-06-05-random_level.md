---
title: Start a random unlocked level
requested_by: Legitimate
layout: default
---

```lua
local mmm = Managers.matchmaking
local level_keys = mmm:_get_unlocked_levels_by_party()
local level_key, preferred_levels = mmm:_get_level_key_from_level_weights(level_keys)
Managers.state.game_mode:start_specific_level(level_key)
mod:echo("Starting level %s", level_key)
```
