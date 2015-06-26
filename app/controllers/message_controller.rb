class MessageController < ApplicationController
  def create
    @discussion_id = params[:discussion][:id]
    @author = params[:message][:author]
    @content = params[:message][:content]

    @message = Message.new discussion_id: @discussion_id, author: @author, content: @content
    session[:username] = @author
    render nothing: true unless @message.save
  end

  def destroy
    @id = params[:id]
    Message.destroy @id
  end
end
