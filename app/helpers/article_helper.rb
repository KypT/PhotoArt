module ArticleHelper
  def short_version
    params[:section] != 'news'
  end
end