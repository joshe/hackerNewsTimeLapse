class CreateTimestamps < ActiveRecord::Migration
  def self.up
    create_table :timestamps do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :timestamps
  end
end
