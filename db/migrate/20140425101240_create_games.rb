class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    	t.string :name
    	t.string :code
      t.integer :num_alive
      t.boolean :is_started
      t.boolean :has_ended
      t.float :term_hrs

      t.timestamps
    end
  end
  def down
  	drop_table :games
  end
end
