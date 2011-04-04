class CreateSubsections < ActiveRecord::Migration
  def self.up
    create_table :subsections, :force=>true do |t|
      t.integer :section_id
      t.string :code
      t.string :name
      t.integer :gma_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subsections
  end
end
