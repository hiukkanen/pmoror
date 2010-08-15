class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.integer :code, :default => 0
      t.timestamps
      t.integer :task_id
    end
    remove_column :tasks, :status
  end

  def self.down
    drop_table :statuses
    add_column :task, :status, :integer
  end
end
