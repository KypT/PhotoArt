class MainController < ApplicationController
  def index
  end

  def about
  end

  def send_email
    PhotoMailer.send_message_to_author(params).deliver
    respond_to {|format| format.js }
  end
end
