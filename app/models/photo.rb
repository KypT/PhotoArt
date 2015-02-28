class Photo < ActiveRecord::Base
  has_attached_file :file, :styles => { :small => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  belongs_to :album
end
