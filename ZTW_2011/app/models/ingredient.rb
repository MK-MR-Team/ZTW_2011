class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes, :join_table => :recipes_ingredients
  has_and_belongs_to_many :pizzas, :join_table => :pizzas_ingredients
  validates :name, :uniqueness => true
end
