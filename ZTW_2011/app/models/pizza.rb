class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_one :recipe
  belongs_to :order
end