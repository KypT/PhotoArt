class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, :registerable

  def admin?
    self.role == 'admin'
  end
end