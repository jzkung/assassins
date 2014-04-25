class CreateKills < ActiveRecord::Migration
  def change
    create_table :kills do |t|
    	t.boolean :verified
    	t.string :location
    	t.datetime :deadline
    	t.datetime :time_killed

    	t.timestamps
    end
  end
end
