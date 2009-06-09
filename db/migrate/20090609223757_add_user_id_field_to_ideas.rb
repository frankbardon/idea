class AddUserIdFieldToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :user_id, :integer
    add_index :ideas, :user_id
  end

  def self.down
    remove_index :ideas, :user_id
    remove_column :ideas, :user_id
  end
end
