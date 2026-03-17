---
title: Posts
icon: fab fa-microblog
order: 3
---

This board is for general posts unrelated to publications.

{% assign posts = site.posts | where_exp: 'item', 'item.hidden != true' %}

{% if posts.size > 0 %}
<section class="archive-board archive-board-posts">
  {% for post in posts %}
    <article class="archive-card">
      <h3 class="archive-card-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h3>
      <p class="archive-card-meta">
        <span class="archive-card-label">Date</span>
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
      </p>
      <p class="archive-card-summary">{{ post.excerpt | strip_html | strip | truncate: 180 }}</p>
    </article>
  {% endfor %}
</section>
{% else %}
No posts yet.

Create your first file in `_posts/`.
{% endif %}
