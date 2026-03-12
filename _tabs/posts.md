---
title: Posts
icon: fas fa-microblog
order: 3
---

This board is for general posts unrelated to publications.

{% assign posts = site.posts | where_exp: 'item', 'item.hidden != true' %}

{% if posts.size > 0 %}
  {% for post in posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

- Date: {{ post.date | date: "%Y-%m-%d" }}
- Summary: {{ post.excerpt | strip_html | truncate: 180 }}

  {% endfor %}
{% else %}
No posts yet.

Create your first file in `_posts/`.
{% endif %}
