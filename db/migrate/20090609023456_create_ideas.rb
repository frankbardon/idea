class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :title
      t.text   :description
      t.string :ip, :limit => 15
      t.string :client
      t.string :lang, :limit => 5
      t.string :geo
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ideas
  end
end
