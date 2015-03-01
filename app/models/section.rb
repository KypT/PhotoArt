class Section < ActiveRecord::Base
  validates_presence_of :name, :message => 'Название секции не может быть пустым'
  validates_presence_of :url, :message => 'Путь не может отсутствовать'
end
