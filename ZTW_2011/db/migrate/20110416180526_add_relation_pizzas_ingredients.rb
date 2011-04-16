class AddRelationPizzasIngredients < ActiveRecord::Migration
  def self.up
    create_table :pizzas_ingredients, :id => false do |t|
      t.integer :pizza_id
      t.integer :ingredient_id
    end
  end

  def self.down
    drop_table :recipes_ingredients
  end
end
