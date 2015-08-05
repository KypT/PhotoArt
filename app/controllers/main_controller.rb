class MainController < ApplicationController
  def index
    @page_keywords = keywords
    @page_description = description
  end

  def about
    @page_keywords = keywords
    @page_description = description
    @page_title = 'Всеволод Тоботрас. Об авторе'
  end

  def send_email
    PhotoMailer.send_message_to_author(params).deliver_now
    respond_to {|format| format.js }
  end

  def sitemap
    @sections = Section.all
    @articles = Article.all
    @albums = Album.all
  end

  private
  def keywords
    'Всеволод Тоботрас,фотография,фотошкола,путешествия,обучение,фотосъемка'
  end
  def description
    'Всеволод Тоботрас - профессиональный фотограф и преподаватель авторского курса фотографии'
  end
end
