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
    {% assign publication_type_raw = pub.publication_type | default: pub.pub_type | default: pub.type | strip %}
    {% assign publication_type = '' %}

    {% if publication_type_raw != '' %}
      {% assign publication_type_normalized = publication_type_raw | downcase %}

      {% if publication_type_normalized == 'journal' %}
        {% assign publication_type = 'Journal' %}
      {% elsif publication_type_normalized == 'conference' %}
        {% assign publication_type = 'Conference' %}
      {% endif %}
    {% endif %}

    {% if publication_type == '' %}
      {% if pub.tags contains 'preprint' %}
        {% assign publication_type = 'Journal' %}
      {% else %}
        {% assign publication_type = 'Conference' %}
      {% endif %}
    {% endif %}

    {% assign publication_venue = pub.venue_short | default: pub.venue | default: 'Venue TBD' | strip %}

    <article class="archive-card">
      <h3 class="archive-card-title">
        <a href="{{ pub.url | relative_url }}">{{ pub.title }}</a>
      </h3>

      <div class="archive-card-tags" aria-label="Publication metadata tags">
        <span class="archive-chip archive-chip-type">{{ publication_type }}</span>
        <span class="archive-chip archive-chip-venue" title="{{ publication_venue | escape }}">{{ publication_venue }}</span>
      </div>

      <p class="archive-card-meta">
        <span class="archive-card-label">Date</span>
        <time datetime="{{ pub.date | date_to_xmlschema }}">{{ pub.date | date: "%Y-%m-%d" }}</time>
      </p>
      <p class="archive-card-summary">{{ pub.excerpt | strip_html | strip | truncate: 180 }}</p>
    </article>
  {% endfor %}
</section>
{% else %}
No publication posts yet.

Create your first file in `_publications/` with front matter.
{% endif %}
