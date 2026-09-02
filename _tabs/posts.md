---
title: Posts
icon: fab fa-microblog
order: 3
---

Notes, project write-ups, and things I'm learning.

{% assign posts = site.posts | where_exp: 'item', 'item.hidden != true' | sort: 'date' | reverse %}

{% if posts.size > 0 %}
<div class="archive-board archive-board-posts">
  {% assign current_year = '' %}
  {% for post in posts %}
    {% assign post_year = post.date | date: '%Y' %}
    {% if post_year != current_year %}
      {% assign current_year = post_year %}
      <h2 class="archive-year">{{ post_year }}</h2>
    {% endif %}
    <article class="archive-card post-card">
      <h3 class="archive-card-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h3>

      <p class="archive-card-meta">
        <i class="far fa-calendar fa-fw" aria-hidden="true"></i>
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: '%b %-d, %Y' }}</time>
      </p>

      {% if post.tags.size > 0 %}
        <div class="archive-card-tags" aria-label="Tags">
          {% for tag in post.tags %}
            {% assign tag_url = tag | slugify | prepend: '/tags/' | append: '/' | relative_url %}
            <a class="archive-chip {% if forloop.first %}archive-chip-primary{% else %}archive-chip-tag{% endif %}" href="{{ tag_url }}">{{ tag }}</a>
          {% endfor %}
        </div>
      {% endif %}

      <p class="archive-card-summary">{{ post.excerpt | strip_html | strip | truncate: 180 }}</p>
    </article>
  {% endfor %}
</div>
{% else %}
No posts yet. Create your first file in `_posts/`.
{% endif %}
