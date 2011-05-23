class AddBasicToIngredients < ActiveRecord::Migration
  def self.up
    add_column :ingredients, :basic, :boolean
  end

  def self.down
    remove_column :ingredients, :basic
  end
end
