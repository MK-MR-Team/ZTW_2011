class AlterOrderAddUserData < ActiveRecord::Migration
  def self.up
    add_column :orders, :firstName, :string
    add_column :orders, :surname, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
  end

  def self.down
    remove_column :orders, :firstName
    remove_column :orders, :surname
    remove_column :orders, :address
    remove_column :orders, :phone
    remove_column :orders, :email
  end
end