class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    	t.string :name
    	t.string :code
      t.datetime :reg_start
      t.datetime :reg_end
      t.datetime :game_start
      t.integer :num_alive
      t.boolean :is_started

      t.timestamps
    end
  end
  def down
  	drop_table :games
  end
end
