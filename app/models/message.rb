class Message < ActiveRecord::Base
  validates_presence_of :author, :content
  belongs_to :discussion
end
