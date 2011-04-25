class User < ActiveRecord::Base
  has_many :orders

  validates :login, :uniqueness => true,
                    :length => 6..45
  validates :password, :length => 6..45,
                       :confirmation => true
  validates :firstName, :length => 2..45
  validates :surname, :length => 2..45
  validates :address, :length => 10..255
  validates :email, :length => {:maximum => 40}
  validates :phone, :length => {:maximum => 20}
 
end