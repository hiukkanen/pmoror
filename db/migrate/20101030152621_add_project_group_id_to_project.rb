class AddProjectGroupIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :project_group_id, :integer
  end

  def self.down
    remove_column :projects, :project_group_id
  end
end
