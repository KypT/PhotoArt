class ArticlesController < ApplicationController
  before_action :validate_section_param!
  before_action :find_article, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!, only: [:new, :create, :update, :destroy, :edit]

  def index
    @articles = Article.where(section: @section).order(created_at: :desc)
    @articles = @articles.paginate page: params[:page], per_page: 10
    @page_title = 'Всеволод Тоботрас. Новости'
  end

  def show
    @page_title = 'Всеволод Тоботрас. ' + @article.title
    @discussion = @article.discussion
  end

  def new
    @article = Article.new
    @action = 'create'
  end

  def create
    @article = Article.new(article_params.merge section: @section)
    if @article.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
    @action = 'update'
  end

  def update
    @article = Article.find(params[:id])
    if @article.update article_params
      redirect_to article_path id: @article.id
    else
      render edit_article_path id: @article.id
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def find_article
    @article = Article.find params[:id]
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def translate_section(section)
    {'travel' => 'Фотоэкспедиции', 'photography' => 'Фотосъемка',
     'teaching' => 'Фотошкола', 'news' => 'Новости',
     'publications' => 'Публикации'}[section]
  end

  def validate_section_param!
    @section = params[:section]
    valid_sections = %w( news teaching travel photography publications )
    not_found unless valid_sections.include? @section
  end
end