class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news, :force=>true do |t|
      t.string :subject
      t.text :body
      t.boolean :stick
      t.date :published_on
      t.date :expired_on
      t.integer :gma_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end