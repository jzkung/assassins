class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down

    game2 = Game.new(:name => "GameTest5_19", :code => "game2")
    game2.save(:validate => false)

    salt = rand()
    pass = "test"
    simon = User.new(:first_name => "Simon", :last_name => "Shachter", :email => "simonys@stanford.edu", :login => "simon", :phone_number => "6505751462", :role => "admin", :status => "alive", :password => pass)
    simon.save(:validate => false)
    jessica = User.new(:first_name => "Jessica", :last_name => "Kung", :email => "jzkung@stanford.edu", :login => "jessica", :phone_number => "6503916448", :role => "admin", :status => "alive", :password => pass)
    jessica.save(:validate => false)
    # kat = User.new(:first_name => "Kat", :last_name => "Phan", :email => "kxphan@stanford.edu", :login => "kat", :phone_number => "6505751434", :role => "player", :status => "alive", :kill_code => "kat", :password => pass)
    # kat.game = game1
    # kat.save(:validate => false)
    # emily = User.new(:first_name => "Emily", :last_name => "Nguyen", :email => "emily@stanford.edu", :login => "emily", :phone_number => "6503916423", :role => "player", :status => "alive", :kill_code => "emily", :password => pass)
    # emily.game = game1
    # emily.save(:validate => false)
    # bradley = User.new(:first_name => "Bradley", :last_name => "Wo", :email => "bwo@stanford.edu", :login => "bradley", :phone_number => "6505751412", :role => "player", :status => "alive", :kill_code => "bradley", :password => pass)
    # bradley.game = game1
    # bradley.save(:validate => false)
    # princess = User.new(:first_name => "Princess", :last_name => "Umodu", :email => "princess@stanford.edu", :login => "princess", :phone_number => "6503916426", :role => "player", :status => "alive", :kill_code => "princess", :password => pass)
    # princess.game = game1
    # princess.save(:validate => false)
    simon2 = User.new(:first_name => "Simon2", :last_name => "Shachter2", :email => "simonys@stanford.edu", :login => "simon2", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    simon2.game = game2
    simon2.save(:validate => false)
    simon3 = User.new(:first_name => "Simon3", :last_name => "Shachter3", :email => "simonys@stanford.edu", :login => "simon3", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    simon3.game = game2
    simon3.save(:validate => false)
    simon4 = User.new(:first_name => "Simon4", :last_name => "Shachter4", :email => "simonys@stanford.edu", :login => "simon4", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    simon4.game = game2
    simon4.save(:validate => false)


    # kat.update(assassin: princess, target: princess)
    # emily.update(assassin: bradley, target: kat)
    # bradley.update(assassin: princess, target: emily)
    # princess.update(assassin: kat, target: bradley)

    # kat.save(:validate => false)
    # emily.save(:validate => false)
    # bradley.save(:validate => false)
    # princess.save(:validate => false)
  end

  def down
      User.delete_all
      Game.delete_all
  end
end
