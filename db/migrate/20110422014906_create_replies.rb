class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies, :force=>true do |t|
      t.integer :notice_id
      t.text :body
      t.string :pic
      t.integer :gma_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
