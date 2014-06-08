class CreateUsers < ActiveRecord::Migration
  def up

    create_table :users do |t|
      t.belongs_to :game
      t.belongs_to :target
      t.belongs_to :assassin
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :phone_number
      t.float :killring_degrees

      t.datetime :term_date

      t.string :role # e.g. admin, mod, player
      t.string :status # e.g. alive, dead
      t.string :kill_code

      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
