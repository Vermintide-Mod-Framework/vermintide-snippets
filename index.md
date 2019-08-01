---
title: Index of All Snippets
---

{% for snip in site.snippets %}
  <li class="snippet-index">
    <a href="{{ snip.url | relative_url }}">{{ snip.title }}</a>
    {% if snip.description %}<span class="description">{{ snip.description }}</span>{% endif %}
    {% if snip.author %}<span class="author">by {{ snip.author }}</span>{% endif %}
    {% if snip.requested_by %}<span class="requester">(Requested by {{ snip.requested_by }})</span>{% endif %}
  </li>
{% endfor %}
