class RemoveStartAndDeliveryTimeFromOrders < ActiveRecord::Migration
  def self.up
    remove_column :orders, :startTime
    remove_column :orders, :deliveryTime
    change_column :orders, :finishTime, :dateTime
  end

  def self.down
    add_column :orders, :deliveryTime, :time
    add_column :orders, :startTime, :time
    change_column :orders, :finishTime, :time
  end
end
