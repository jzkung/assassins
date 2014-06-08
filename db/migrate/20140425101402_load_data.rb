class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down

    game2 = Game.new(:name => "GameTest5_19", :code => "game2", :is_started => false, :has_ended => false, :num_alive => 11, :email => "jro.assassins@gmail.com", :term_hrs => 0.003)
    game2.save(:validate => false)

    # salt = rand()
    # simon = User.new(:first_name => "Simon", :last_name => "Shachter", :email => "simonys@stanford.edu", :login => "simon", :phone_number => "6505751462", :role => "admin", :status => "alive", :password => pass)
    # simon.save(:validate => false)
     jessica = User.new(:first_name => "Jessica", :last_name => "Kung", :name => "Jessica Kung", :email => "jzkung@stanford.edu", :role => "admin", :status => "alive", :provider => 'facebook', :uid => '10152272029596026', :image_url => 'http://graph.facebook.com/10152272029596026/picture?type=large')
     jessica.save(:validate => false)
    # # kat = User.new(:first_name => "Kat", :last_name => "Phan", :email => "kxphan@stanford.edu", :login => "kat", :phone_number => "6505751434", :role => "player", :status => "alive", :kill_code => "kat", :password => pass)
    # # kat.game = game1
    # # kat.save(:validate => false)
    # # emily = User.new(:first_name => "Emily", :last_name => "Nguyen", :email => "emily@stanford.edu", :login => "emily", :phone_number => "6503916423", :role => "player", :status => "alive", :kill_code => "emily", :password => pass)
    # # emily.game = game1
    # # emily.save(:validate => false)
    # # bradley = User.new(:first_name => "Bradley", :last_name => "Wo", :email => "bwo@stanford.edu", :login => "bradley", :phone_number => "6505751412", :role => "player", :status => "alive", :kill_code => "bradley", :password => pass)
    # # bradley.game = game1
    # # bradley.save(:validate => false)
    # # princess = User.new(:first_name => "Princess", :last_name => "Umodu", :email => "princess@stanford.edu", :login => "princess", :phone_number => "6503916426", :role => "player", :status => "alive", :kill_code => "princess", :password => pass)
    # # princess.game = game1
    # # princess.save(:validate => false)
    # simon2 = User.new(:first_name => "Simon2", :last_name => "Shachter2", :email => "simon.smiley@gmail.com", :login => "simon2", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon2.game = game2
    # simon2.save(:validate => false)
    # simon3 = User.new(:first_name => "Simon3", :last_name => "Shachter3", :email => "simon.smiley@gmail.com", :login => "simon3", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon3.game = game2
    # simon3.save(:validate => false)
    # simon4 = User.new(:first_name => "Simon4", :last_name => "Shachter4", :email => "simon.smiley@gmail.com", :login => "simon4", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon4.game = game2
    # simon4.save(:validate => false)
    # simon5 = User.new(:first_name => "Simon5", :last_name => "Shachter5", :email => "simon.smiley@gmail.com", :login => "simon5", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon5.game = game2
    # simon5.save(:validate => false)
    # simon6 = User.new(:first_name => "Simon6", :last_name => "Shachter6", :email => "simon.smiley@gmail.com", :login => "simon6", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon6.game = game2
    # simon6.save(:validate => false)
    # simon7 = User.new(:first_name => "Simon7", :last_name => "Shachter7", :email => "simon.smiley@gmail.com", :login => "simon7", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon7.game = game2
    # simon7.save(:validate => false)
    # simon8 = User.new(:first_name => "Simon8", :last_name => "Shachter8", :email => "simon.smiley@gmail.com", :login => "simon8", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon8.game = game2
    # simon8.save(:validate => false)
    # simon9 = User.new(:first_name => "Simon9", :last_name => "Shachter9", :email => "simon.smiley@gmail.com", :login => "simon9", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon9.game = game2
    # simon9.save(:validate => false)
    # simon10 = User.new(:first_name => "Simon10", :last_name => "Shachter10", :email => "simon.smiley@gmail.com", :login => "simon10", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon10.game = game2
    # simon10.save(:validate => false)
    # simon11 = User.new(:first_name => "Simon11", :last_name => "Shachter11", :email => "simon.smiley@gmail.com", :login => "simon11", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon11.game = game2
    # simon11.save(:validate => false)
    # simon12 = User.new(:first_name => "Simon12", :last_name => "Shachter12", :email => "simon.smiley@gmail.com", :login => "simon12", :phone_number => "6505751462", :role => "player", :status => "alive", :kill_code => "kill", :password => pass)
    # simon12.game = game2
    # simon12.save(:validate => false)


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
