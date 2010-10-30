class AddProjectGroupIdToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :project_group_id, :integer
  end

  def self.down
    remove_column :tasks, :project_group_id
  end
end
