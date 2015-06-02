module Admin
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy]

    def index
      @articles = Article.all
    end

    def edit
      @photo = @article.photos.first
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        update_image @article.id
        redirect_to admin_path, notice: 'Новость добавлена.'
      else
        render :new
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path, notice: 'Новость удалена.'
    end

    def update
      if @article.update article_params
        update_image @article.id
        redirect_to admin_articles_path, notice: 'Новость успешно обновлена.'
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

    def update_image(id)
      if @photo != nil
        if @article.photos[0]
          @article.photos[0].destroy
        end
        save_image id, @photo
      end
    end

    def save_image(id, photo)
      Photo.create({:article_id => id, :file => photo})
    end

    def article_params
      @photo = params.require(:article)[:photo]
      params.require(:article).permit(:title, :content)
    end
  end
end