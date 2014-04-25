class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :game
      t.belongs_to :target
      t.belongs_to :assassin
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :login
      t.string :phone_number
      t.float :salt
      t.string :password_digest

      t.string :role # e.g. admin, mod, player
      t.string :status # e.g. alive, dead

      t.timestamps
    end
  end
end
