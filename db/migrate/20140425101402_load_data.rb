class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down

    game2 = Game.new(:name => "GameTest5_19", :code => "game2", :is_started => false, :has_ended => false, :num_alive => 2, :term_hrs => 0.003)
    game2.save(:validate => false)

    # salt = rand()
    simon = User.new(:first_name => "Simon", :last_name => "Shachter", :name => "Simon Shachter", :email => "simonys@stanford.edu", :role => "admin", :status => "alive", :provider => 'facebook', :uid => '10152113038792601', :image_url => 'http://graph.facebook.com/10152113038792601/picture?type=large')
    simon.game = game2
    simon.save(:validate => false)
    jessica = User.new(:first_name => "Jessica", :last_name => "Kung", :name => "Jessica Kung", :email => "jzkung@stanford.edu", :role => "admin", :status => "alive", :provider => 'facebook', :uid => '10152272029596026', :image_url => 'http://graph.facebook.com/10152272029596026/picture?type=large')
    jessica.game = game2
    jessica.save(:validate => false)
    xin = User.new(:first_name => "Xinxin", :last_name => "Xin", :name => "Xinxin Xin", :email => "aethereal.star@gmail.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '713213705401523', :image_url => 'http://graph.facebook.com/713213705401523/picture?type=large', :profile_url => 'https://www.facebook.com/713213705401523')
    xin.game = game2
    xin.save(:validate => false)
    stari = User.new(:first_name => "Stari", :last_name => "Xin", :name => "Stari Xin", :email => "starixin@yahoo.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '241125379416448', :image_url => 'http://graph.facebook.com/241125379416448/picture?type=large', :profile_url => 'https://www.facebook.com/241125379416448')
    stari.game = game2
    stari.save(:validate => false)
    # simone = User.new(:first_name => "Simone", :last_name => "Yamawaki", :name => "Simone Yamawaki", :email => "simon@stanfordharmonics.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '1488558751376854', :image_url => 'http://graph.facebook.com/1488558751376854/picture?type=large', :profile_url => 'https://www.facebook.com/1488558751376854')
    # simone.game = game2
    # simone.save(:validate => false)
    # princess = User.new(:first_name => "Princess", :last_name => "Umodu", :name => "Princess Umodu", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '470592729754137', :image_url => 'http://graph.facebook.com/470592729754137/picture?type=large', :profile_url => 'https://www.facebook.com/470592729754137')
    # princess.game = game2
    # princess.save(:validate => false)
    # dhruti = User.new(:first_name => "Dhruti", :last_name => "Gopaluni", :name => "Dhruti Gopaluni", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '808300952515603', :image_url => 'http://graph.facebook.com/808300952515603/picture?type=large', :profile_url => 'https://www.facebook.com/808300952515603')
    # dhruti.game = game2
    # dhruti.save(:validate => false)
    # sophie = User.new(:first_name => "Sophie", :last_name => "Clark", :name => "Sophie Clark", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '759988647365769', :image_url => 'http://graph.facebook.com/759988647365769/picture?type=large', :profile_url => 'https://www.facebook.com/759988647365769')
    # sophie.game = game2
    # sophie.save(:validate => false)
    # emily = User.new(:first_name => "Emily", :last_name => "Nguyen", :name => "Emily Nguyen", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '813487398661335', :image_url => 'http://graph.facebook.com/813487398661335/picture?type=large', :profile_url => 'https://www.facebook.com/813487398661335')
    # emily.game = game2
    # emily.save(:validate => false)
    
  end

  def down
      User.delete_all
      Game.delete_all
  end
end
