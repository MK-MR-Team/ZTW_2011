class AddRelationPizzasRecipes < ActiveRecord::Migration
  def self.up
    add_column :pizzas, :recipe_id, :integer, :null => false, :default => 1
  end

  def self.down
    remove_column :pizzas, :recipe_id
  end
end
