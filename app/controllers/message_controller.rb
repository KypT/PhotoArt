class MessageController < ApplicationController
  before_action :authenticate_admin!, only: 'destroy'
  def create
    @discussion_id = params[:discussion][:id]
    @content = params[:message][:content]

    @discussion = Discussion.find @discussion_id

    email_list = {}
    @discussion.messages.each do | message |
      user = message.user
      email_list[user.nickname] = user.email if !user.nil? and user.id != current_user.id
    end

    puts email_list.inspect

    email_list.each_value do |email|
      PhotoMailer.comment_notification(email, current_user.nickname, @discussion.discussable).deliver_now
    end

    @message = Message.new discussion_id: @discussion_id, user: current_user, content: @content

    render nothing: true unless @message.save
  end

  def destroy
    @id = params[:id]
    Message.destroy @id
  end
end
