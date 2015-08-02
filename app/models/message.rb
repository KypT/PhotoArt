class Message < ActiveRecord::Base
  validates_presence_of :author, :content
  belongs_to :discussion
  after_create :send_notification

  private
  def send_notification
    PhotoMailer.send_comment_notification(link: self.discussion.discussable).deliver_now
  end
end
