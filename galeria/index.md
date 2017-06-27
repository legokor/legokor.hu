---
title: Galeria
layout: default
---

{% for item in site.album %}
  [{{ item.title }}]({{ item.url }})
{% endfor %}
