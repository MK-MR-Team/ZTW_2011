class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, :join_table => :pizzas_ingredients
  has_one :recipe
  belongs_to :order

  def initialize(recipe)
    this.recipe = recipe
  end

  
end