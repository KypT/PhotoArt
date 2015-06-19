class ArticlesController < ApplicationController
  def all
    @articles = Article.all.order created_at: 'desc'
    @page_title = 'Всеволод Тоботрас. Новости'
  end

  def read
    @article = Article.find(params[:id])
    @page_title = 'Всеволод Тоботрас. ' + @article.title
  end
end
