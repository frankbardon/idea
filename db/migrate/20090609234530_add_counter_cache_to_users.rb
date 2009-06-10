class AddCounterCacheToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :ideas_count, :integer
  end

  def self.down
    remove_column :users, :ideas_count
  end
end
