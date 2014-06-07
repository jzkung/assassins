class CreateKills < ActiveRecord::Migration
  def up
    create_table :kills do |t|
      t.belongs_to :game
      t.belongs_to :target
      t.belongs_to :assassin
      t.string :code
    	t.string :lat
      t.string :lng
    	t.datetime :deadline
    	t.datetime :time_killed

    	t.timestamps
    end
  end
  def down
  	drop_table :kills
  end
end
