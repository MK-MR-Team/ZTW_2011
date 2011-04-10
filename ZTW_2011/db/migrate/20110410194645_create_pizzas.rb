class CreatePizzas < ActiveRecord::Migration
  def self.up
    create_table :pizzas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pizzas
  end
end
