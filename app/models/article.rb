class Article < ActiveRecord::Base
  validates_presence_of :title, :message => 'Загаловок не может быть пустым'
  validates_presence_of :content, :message => 'Содержание не может отсутствовать'
end
