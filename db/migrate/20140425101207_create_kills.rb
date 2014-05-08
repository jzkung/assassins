class CreateKills < ActiveRecord::Migration
  def up
    create_table :kills do |t|
      t.belongs_to :target
      t.belongs_to :user
    	t.boolean :verified
    	t.string :location
    	t.datetime :deadline
    	t.datetime :time_killed

    	t.timestamps
    end
  end
  def down
  	drop_table :kills
  end
end
