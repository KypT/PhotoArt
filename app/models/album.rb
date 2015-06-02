class Album < ActiveRecord::Base
  validates_presence_of :name, :message => 'Название альбома не может быть пустым'
  has_many :photos
end
