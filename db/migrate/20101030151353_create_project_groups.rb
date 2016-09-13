class CreateProjectGroups < ActiveRecord::Migration
  def self.up
    create_table :project_groups, &:timestamps
  end

  def self.down
    drop_table :project_groups
  end
end
