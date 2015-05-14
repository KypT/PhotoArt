class ArticlesController < ApplicationController
  def all
    @articles = Article.all
  end

  def read
    @article = Article.find(params[:id])
    @photo = @article.photos.first
  end
end
