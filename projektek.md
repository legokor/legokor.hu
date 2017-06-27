---
title: Projekek
layout: default
---
{% for project in site.projects %}
  [{{ project.title }}]({{ project.url }})
{% endfor %}
