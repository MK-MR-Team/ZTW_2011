class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, :join_table => :recipes_ingredients
  has_many :pizzas

  validates :name, :uniqueness => true
end