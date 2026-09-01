---
title: Publications
icon: fas fa-newspaper
order: 2
---

This board lists publication notes in blog format.

{% assign publications = site.publications | sort: 'date' | reverse %}

{% if publications.size > 0 %}
<section class="archive-board archive-board-publications">
  {% for pub in publications %}
    {% include publication-card.html pub=pub %}
  {% endfor %}
</section>
{% else %}
No publication posts yet.

Create your first file in `_publications/` with front matter.
{% endif %}
