module DiscussionHelper
  def owner_name(message)
    return message.user.nickname if message.user
    'Аноним'
  end

  def owner_email(message)
    return message.user.email if message.user
    ''
  end
end