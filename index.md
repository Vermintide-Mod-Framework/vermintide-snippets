---
layout: default
---

## Vermintide Snippets

{% for snip in site.snippets %}
  <li>
    <a href="{{ snip.url | relative_url }}">{{ snip.title }}</a>
    <span class="postDate">{{ snip.date | date: "%-d %b %Y" }}</span>
  </li>
{% endfor %}
