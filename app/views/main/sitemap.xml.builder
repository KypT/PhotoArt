xml.instruct!
xml.urlset('xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9') {
  xml.url {
    xml.loc(root_url)
    xml.lastmod(Time.now.to_date)
    xml.changefreq('monthly')
    xml.priority(1.0)
  }

  @sections.each do | section |
    xml.url {
      xml.loc(URI.join (root_url + section.url[1..-1]))
      xml.lastmod(Time.now.to_date)
      xml.changefreq('daily')
      xml.priority(0.6)
    }
  end

  @articles.each do | article |
    xml.url {
      xml.loc(URI.join (root_url + article.section + '/' + article.id.to_s))
      xml.lastmod(article.updated_at.to_date)
      xml.changefreq('weekly')
      xml.priority(0.9)
    }
  end

  @albums.each do | album |
    xml.url {
      xml.loc(URI.join (root_url + 'gallery/' + album.id.to_s))
      xml.lastmod(album.updated_at.to_date)
      xml.changefreq('weekly')
      xml.priority(0.9)
    }
  end
}
