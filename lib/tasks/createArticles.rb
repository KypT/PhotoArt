Event.all.each do | event |
  Article.create(section: event.section, title: event.title, content: event.content, created_at: event.created_at, updated_at: event.updated_at)
end

Article.all.each do | article |
  article.section = 'news' if article.section == nil or article.section == ''
  article.save
end

Article.all.each do | article |
  article.discussion = Discussion.create
  article.save
end
