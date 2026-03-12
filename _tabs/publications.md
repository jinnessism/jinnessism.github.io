---
title: Publications
icon: fas fa-book-open
order: 2
---

This board lists publication notes in blog format.

{% assign publications = site.publications | sort: 'date' | reverse %}

{% if publications.size > 0 %}
  {% for pub in publications %}
### [{{ pub.title }}]({{ pub.url | relative_url }})

- Date: {{ pub.date | date: "%Y-%m-%d" }}
- Summary: {{ pub.excerpt | strip_html | truncate: 180 }}

  {% endfor %}
{% else %}
No publication posts yet.

Create your first file in `_publications/` with front matter.
{% endif %}
