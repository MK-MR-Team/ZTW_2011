class Pizza < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, :join_table => :pizzas_ingredients
  belongs_to :recipe
  belongs_to :order

  @@default_ingredients = ["Cheese", "Tomato sauce"]

  def Pizza.default_ingredients
    @@default_ingredients
  end

  #Zwraca prawdziwa liste skladnikow pizzy, razem te z przepisu i z dodanych skladnikow
  #pizza.ingredients nie powinno byc uzywane
  def all_ingredients
    all_ingredients = Array.new
    Ingredient.all.each do |i|
    if (self.ingredients.include?(i) ^ self.recipe.ingredients.include?(i)) then
      all_ingredients << i
    end
    end
    all_ingredients
  end

  #Zwraca liste skladnikow, ktorych nie ma w pizzy ani w przepisie
  def other_ingredients
    temp_ingredients = self.ingredients
    temp_recipe_ingredients = self.recipe.ingredients
    Ingredient.all - temp_ingredients - temp_recipe_ingredients
  end

  #Zwraca liste tylko tych sklaednikow, ktore sa dodatkowo dodane (nie ma ich w przepisie)
  def only_added_ingredients
    temp_ingredients = self.recipe.ingredients
    all_ingredients - temp_ingredients
  end

  def price
    price = self.recipe.price
    only_added_ingredients.each do |i|
      price += i.price
    end
    price
  end
end