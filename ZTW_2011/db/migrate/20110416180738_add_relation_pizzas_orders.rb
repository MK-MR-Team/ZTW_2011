class AddRelationPizzasOrders < ActiveRecord::Migration
  def self.up
    add_column :pizzas, :order_id, :integer
  end

  def self.down
     remove_column :pizzas, :order_id
  end
end
