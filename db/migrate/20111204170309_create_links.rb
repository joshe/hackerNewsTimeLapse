class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :rank
      t.string :href
      t.string :title
      t.string :comments
      t.references :timestamp

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
