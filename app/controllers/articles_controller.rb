class ArticlesController < ApplicationController
  def all
    @articles = Article.all.order created_at: 'desc'
  end

  def read
    @article = Article.find(params[:id])
  end
end
