---
title: Set characters to max level
requested_by: Exan
---

mod:hook(BackendInterfaceHeroAttributesPlayFab, "get", function (func, self, hero_name, attribute_name)
    if attribute_name == "experience" then return 1e8 end
    return func(self, hero_name, attribute_name)
end)
mod:hook(Achievement, "unlock", function(func, ...) return end)
