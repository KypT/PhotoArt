class PhotoMailer < ApplicationMailer

  def author_email
    'sever-1@mail.ru'
  end

  def send_message_to_author(data)
    @email = data[:email]
    @from = data[:from]
    @message = data[:message]
    @subject = "Новое сообщение от #{@from}"
    mail(to: author_email, subject: @subject)
  end

  def send_comment_notification(data)
    @discussable = data[:link]
    @subject = 'На сайте новый комментарий'
    mail(to: author_email, subject: @subject)
  end

  def comment_notification(email, nickname, link)
    @discussable = link
    @subject = 'Новый комментарий от пользователя ' + nickname
    mail(to: email, subject: @subject)
  end
end
