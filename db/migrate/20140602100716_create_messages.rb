class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.belongs_to :player
      t.belongs_to :game
      t.string :content
      t.boolean :deleted
      t.datetime :post_date

      t.timestamps
    end
  end

  def down
  	drop_table :messages
  end
end
