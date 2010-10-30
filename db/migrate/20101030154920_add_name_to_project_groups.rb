class AddNameToProjectGroups < ActiveRecord::Migration
  def self.up
    add_column :project_groups, :name, :string
  end

  def self.down
    remove_column :project_groups, :name
  end
end
