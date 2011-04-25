class Order < ActiveRecord::Base
  has_many :pizzas
  belongs_to :user

  validates :firstName, :length => 2..45
  validates :surname, :length => 2..45
  validates :address, :length => 10..255
  validates :email, :length => {:maximum => 40}
  validates :phone, :length => 6..20

  def price
    price = 0
    self.pizzas.each do |p|
      price += p.price
    end
    price
  end
  
end