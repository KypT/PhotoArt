class DiscussionController < ApplicationController
  def index
    @discussion = Discussion.find params[:id]
    @offset = params[:offset] || 0
    @limit = 5
    @messages = @discussion.messages.order(created_at: :desc).limit(@limit).offset(@offset)
    render layout: false
  end
end