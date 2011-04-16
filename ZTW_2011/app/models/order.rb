class Order < ActiveRecord::Base
  has_many :pizzas
  belongs_to :user
end
