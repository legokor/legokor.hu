---
title: Projekek
layout: default
---
{% for project in site.data.projects %}
  {{ project.title }}
  {% assign members = site.data.members | where_exp:"item", "project.members contains item.username" %}
  {% for member in members %}
    {{ member.name }}
  {% endfor %}
  {{ project.description }}
  Szoftver: {{ project.software }}%
  Hardver: {{ project.hardware }}%
  Dokumentacio: {{ project.documentation }}%
{% endfor %}
