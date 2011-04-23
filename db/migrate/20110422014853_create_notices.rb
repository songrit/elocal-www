class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices, :force=>true do |t|
      t.string :subject
      t.text :body
      t.string :pic
      t.boolean :stick
      t.integer :gma_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
