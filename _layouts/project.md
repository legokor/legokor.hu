---
layout: default
---

<h1>{{ page.title }}</h1>
{% assign members = site.data.members | where_exp:"item", "page.members contains item.username" %}
{% for member in members %}
  {{ member.name }}
{% endfor %}
{{ content }}
Szoftver: {{ page.software }}%
Hardver: {{ page.hardware }}%
Dokumentacio: {{ page.documentation }}%
