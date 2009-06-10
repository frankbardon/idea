class CreatePieces < ActiveRecord::Migration
  def self.up
    create_table :pieces do |t|
      t.string :title
      t.text :description
      t.string :ip, :limit => 15
      t.string :client
      t.string :lang, :limit => 5
      t.string :geo
      t.integer :user_id
      t.integer :idea_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pieces
  end
end
