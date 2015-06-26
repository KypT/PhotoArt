class Article < ActiveRecord::Base
  validates_presence_of :title, :message => 'Загаловок не может быть пустым'
  validates_presence_of :content, :message => 'Содержание не может отсутствовать'
  before_create :create_discussion
  has_one :discussion, as: :discussable

  private
  def create_discussion
    self.discussion = Discussion.create
  end
end
