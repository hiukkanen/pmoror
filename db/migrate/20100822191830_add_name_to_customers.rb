class AddNameToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :name, :string
  end

  def self.down
    remove_column :customers, :name
  end
end
