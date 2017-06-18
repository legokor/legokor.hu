---
layout: default
title: Tagok
---
{% for member in site.data.members %}
<h1 id='{{ member.username }}'>{{ member.name }}</h1>
  {% for role in member.roles %}
    {{ role }}
  {% endfor %}
  {% for project in member.projects %}
    {{ project }}
  {% endfor %}
{% endfor %}
