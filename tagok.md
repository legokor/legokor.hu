---
layout: default
title: Tagok
---
{% for member in site.members %}
<h1 id='{{ member.username }}'><a href='{{ member.url }}'>{{ member.name }}</a></h1>
  {% for role in member.roles %}
    {{ role }}
  {% endfor %}
  {% for project in member.projects %}
    {{ project }}
  {% endfor %}
{% endfor %}
