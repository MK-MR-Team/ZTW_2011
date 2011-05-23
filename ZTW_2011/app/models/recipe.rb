class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, :join_table => :recipes_ingredients
  has_many :pizzas

  validates :name, :uniqueness => true
  validates :price, :presence => true

  def before_create
    basic_ingredients = Ingredient.where(:basic => true)
    self.ingredients << basic_ingredients
  end

  def other_ingredients
    temp_ingredients = self.ingredients
    Ingredient.all - temp_ingredients
  end
end