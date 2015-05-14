class Photo < ActiveRecord::Base
  has_attached_file :file, :styles => { :small => "200x200>", :medium => "600x600>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :file

  before_create :save_to_end

  belongs_to :album
  belongs_to :article

  def save_to_end
    self.sort = 99999
  end
end
