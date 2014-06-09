class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down

    game1 = Game.new(:name => "Epic Showdown", :code => "game1", :is_started => true, :has_ended => true, :num_alive => 1, :term_hrs => 24)
    game1.save(:validate => false)

    game2 = Game.new(:name => "Showdown - Upgraded", :code => "game2", :is_started => false, :has_ended => false, :num_alive => 7, :term_hrs => 0.003)
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
    simone = User.new(:first_name => "Simone", :last_name => "Yamawaki", :name => "Simone Yamawaki", :email => "simon@stanfordharmonics.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '1488558751376854', :image_url => 'http://graph.facebook.com/1488558751376854/picture?type=large', :profile_url => 'https://www.facebook.com/1488558751376854')
    simone.game = game2
    simone.save(:validate => false)
    princess = User.new(:first_name => "Princess", :last_name => "Umodu", :name => "Princess Umodu", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '470592729754137', :image_url => 'http://graph.facebook.com/470592729754137/picture?type=large', :profile_url => 'https://www.facebook.com/470592729754137')
    princess.game = game2
    princess.save(:validate => false)
    dhruti = User.new(:first_name => "Dhruti", :last_name => "Gopaluni", :name => "Dhruti Gopaluni", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '808300952515603', :image_url => 'http://graph.facebook.com/808300952515603/picture?type=large', :profile_url => 'https://www.facebook.com/808300952515603')
    dhruti.game = game2
    dhruti.save(:validate => false)
    sophie = User.new(:first_name => "Sophie", :last_name => "Clark", :name => "Sophie Clark", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '759988647365769', :image_url => 'http://graph.facebook.com/759988647365769/picture?type=large', :profile_url => 'https://www.facebook.com/759988647365769')
    sophie.game = game2
    sophie.save(:validate => false)
    emily = User.new(:first_name => "Emily", :last_name => "Nguyen", :name => "Emily Nguyen", :email => "xinnn@live.com", :role => "player", :status => "alive", :kill_code => "kill", :provider => 'facebook', :uid => '813487398661335', :image_url => 'http://graph.facebook.com/813487398661335/picture?type=large', :profile_url => 'https://www.facebook.com/813487398661335')
    emily.game = game2
    emily.save(:validate => false)

    date = DateTime.now.utc-8.hour

    kill1 = Kill.new(:lat => "37.427755", :lng => "-122.166958", :time_killed => date)
    kill1.game = game1
    kill1.target = xin
    kill1.assassin = stari
    kill1.save(:validate => false)
    kill2 = Kill.new(:lat => "37.426835", :lng => "-122.17049", :time_killed => date)
    kill2.game = game1
    kill2.target = stari
    kill2.assassin = simone
    kill2.save(:validate => false)
    kill3 = Kill.new(:lat => "37.422381", :lng => "-122.176005", :time_killed => date)
    kill3.game = game1
    kill3.target = simone
    kill3.assassin = princess
    kill3.save(:validate => false)
    kill4 = Kill.new(:lat => "37.429817", :lng => "-122.169272", :time_killed => date)
    kill4.game = game1
    kill4.target = princess
    kill4.assassin = dhruti
    kill4.save(:validate => false)
    kill5 = Kill.new(:lat => "37.426982", :lng => "-122.167566", :time_killed => date)
    kill5.game = game1
    kill5.target = dhruti
    kill5.assassin = sophie
    kill5.save(:validate => false)
    kill6 = Kill.new(:lat => "37.430612", :lng => "-122.171488", :time_killed => date)
    kill6.game = game1
    kill6.target = sophie
    kill6.assassin = emily
    kill6.save(:validate => false)


    message1 = Message.new(:post_date => date, :content => "Watch Out for Me!")
    message1.player = xin
    message1.game = game1
    message1.save(:validate => false)
    message2 = Message.new(:post_date => date, :content => "Don't let your guard down!")
    message2.player = dhruti
    message2.game = game1
    message2.save(:validate => false)
    message3 = Message.new(:post_date => date, :content => "I'm coming for you and your roommate!")
    message3.player = sophie
    message3.game = game1
    message3.save(:validate => false)
    message4 = Message.new(:post_date => date, :content => "Don't f*** around with this s***")
    message4.player = princess
    message4.game = game1
    message4.save(:validate => false)
    message5 = Message.new(:post_date => date, :content => "I'm DYING!!!")
    message5.player = xin
    message5.game = game1
    message5.save(:validate => false)

    message6 = Message.new(:post_date => date, :content => "Are you ready for this!?")
    message6.player = stari
    message6.game = game2
    message6.save(:validate => false)
    message7 = Message.new(:post_date => date, :content => "You're all gonna die!")
    message7.player = stari
    message7.game = game2
    message7.save(:validate => false)

  end

  def down
      User.delete_all
      Game.delete_all
      Message.delete_all
  end
end
