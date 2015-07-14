class Album < ActiveRecord::Base
  validates_presence_of :name, :message => 'Название альбома не может быть пустым'
  has_one :discussion, as: :discussable
  has_many :photos

  before_create :create_discussion
  private
  def create_discussion
    self.discussion = Discussion.create
  end
end
