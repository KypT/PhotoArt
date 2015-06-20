class MainController < ApplicationController
  def index
  end

  def about
    @page_title = 'Всеволод Тоботрас. Об авторе'
  end

  def send_email
    PhotoMailer.send_message_to_author(params).deliver
    respond_to {|format| format.js }
  end

  def sitemap
    @sections = Section.all
    @articles = Article.all
    @events = Event.all
    @albums = Album.all
  end
end
