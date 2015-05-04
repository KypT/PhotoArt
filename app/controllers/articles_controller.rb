class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def all
    @articles = Article.all
  end

  def read
    @article = Article.find(params[:id])
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: 'Новость добавлена.'
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Новость удалена.'
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Новость успешно обновлена.'
    else
      render :edit
    end
  end

  private
  def set_article
    begin
      @article = Article.find(params[:id])
    rescue
      @article = Article.new
      flash.alert = 'Ошибка: некорректный индекс'
    end
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end