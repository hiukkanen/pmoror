class AddCommentToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :comment, :text
  end

  def self.down
    remove_column :statuses, :comment
  end
end
