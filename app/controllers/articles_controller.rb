class ArticlesController < ApplicationController
  def all
    @articles = Article.all
  end

  def read
    @article = Article.find(params[:id])
  end
end
