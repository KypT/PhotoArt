class MessageController < ApplicationController
  def create
    @discussion_id = params[:discussion][:id]
    @content = params[:message][:content]

    @message = Message.new discussion_id: @discussion_id, user: current_user, content: @content
    render nothing: true unless @message.save
  end

  def destroy
    @id = params[:id]
    Message.destroy @id
  end
end
