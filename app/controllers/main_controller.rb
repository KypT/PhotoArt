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
end
