class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :title
      t.text   :description
      t.string :_ip, :limit => 15
      t.string :_client
      t.string :_lang, :limit => 5
      t.string :_geo
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ideas
  end
end
