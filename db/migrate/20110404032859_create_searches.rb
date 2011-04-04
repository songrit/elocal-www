class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches, :force=>true do |t|
      t.string :item
      t.string :sclass
      t.integer :trip_id
      t.integer :waypoint_id
      t.integer :score
      t.integer :gma_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
