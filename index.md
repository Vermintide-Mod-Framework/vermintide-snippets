---
title: Index
---

{% for snip in site.snippets %}
  <li>
    <a href='{{ snip.url | relative_url }}'>{{ snip.title }}</a> {{ snip.description }}
    {% if snip.author %}<span>by {{ snip.author }}</span>{% endif %}
    {% if snip.requested_by %}<span class='grey'>(Requested by {{ snip.requested_by }})</span>{% endif %}
  </li>
{% endfor %}
