---
title: Galeria
layout: default
---

{% for item in site.album %}
  [{{ item.title }}](/album/{{ item.code }})
{% endfor %}
