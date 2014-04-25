class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    	t.string :name
    	t.string :code

        t.timestamps
    end
  end
  def down
  	drop_table :games
  end
end
