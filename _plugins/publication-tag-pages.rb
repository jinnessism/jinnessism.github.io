#!/usr/bin/env ruby

module Jekyll
  class PublicationTagPage < PageWithoutAFile
    def initialize(site, base, dir, tag_name, tag_slug)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      process(@name)

      self.content = ''
      self.data = {
        'layout' => 'tag',
        'title' => tag_name,
        'tag' => tag_name,
        'permalink' => "/tags/#{tag_slug}/"
      }
    end
  end

  class PublicationTagPageGenerator < Generator
    safe true
    priority :low

    def generate(site)
      publications = site.collections.fetch('publications', nil)
      return unless publications

      publication_tags = publications.docs.each_with_object([]) do |doc, tags|
        next unless published_document?(doc)

        Array(doc.data['tags']).each do |tag|
          next if tag.to_s.strip.empty?

          tags << tag.to_s
        end
      end

      return if publication_tags.empty?

      existing_slugs = site.tags.keys.map { |tag| Utils.slugify(tag.to_s) }
      existing_slugs.concat(site.pages.filter_map { |page| tag_slug_from_url(page.url) })
      existing_slugs = existing_slugs.uniq

      publication_tags.uniq.each do |tag_name|
        tag_slug = Utils.slugify(tag_name)
        next if existing_slugs.include?(tag_slug)

        site.pages << PublicationTagPage.new(site, site.source, File.join('tags', tag_slug), tag_name, tag_slug)
        existing_slugs << tag_slug
      end
    end

    private

    def published_document?(doc)
      doc.data.fetch('published', true) != false
    end

    def tag_slug_from_url(url)
      match = url.to_s.match(%r{^/tags/([^/]+)/$})
      match && match[1]
    end
  end
end