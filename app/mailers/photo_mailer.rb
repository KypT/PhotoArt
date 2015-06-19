class PhotoMailer < ApplicationMailer

  def send_message_to_author(data)
    @email = data[:email]
    @from = data[:from]
    @message = data[:message]
    @subject = "Новое сообщение от #{@from}"
    @send_address = 'sever-1@mail.ru'
    mail(to: @send_address, subject: @subject)
  end
end
