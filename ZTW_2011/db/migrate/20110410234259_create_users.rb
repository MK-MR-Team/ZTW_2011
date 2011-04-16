class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :surname
      t.string :firstName
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
