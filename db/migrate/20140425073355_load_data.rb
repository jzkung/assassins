class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down

    game1 = Game.new(:name => "Name", :code => "Code")
    game1.save(:validate => false)

    salt = rand()
    simon = User.new(:first_name => "Simon", :last_name => "Shachter", :email => "simonys@stanford.edu", :login => "simon", :phone_number => "6505751462", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "admin", :status => "alive")
    simon.save(:validate => false)
    jessica = User.new(:first_name => "Jessica", :last_name => "Kung", :email => "jzkung@stanford.edu", :login => "jessica", :phone_number => "6503916448", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "admin", :status => "alive")
    jessica.save(:validate => false)
    kat = User.new(:first_name => "Kat", :last_name => "Phan", :email => "kxphan@stanford.edu", :login => "kat", :phone_number => "6505751434", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "player", :status => "alive")
    kat.game = game1
    kat.save(:validate => false)
    emily = User.new(:first_name => "Emily", :last_name => "Nguyen", :email => "emily@stanford.edu", :login => "emily", :phone_number => "6503916423", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "player", :status => "alive")
    emily.game = game1
    emily.save(:validate => false)
    bradley = User.new(:first_name => "Bradley", :last_name => "Wo", :email => "bwo@stanford.edu", :login => "bradley", :phone_number => "6505751412", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "player", :status => "alive")
    bradley.game = game1
    bradley.save(:validate => false)
    princess = User.new(:first_name => "Princess", :last_name => "Umodu", :email => "princess@stanford.edu", :login => "princess", :phone_number => "6503916426", :salt => salt, :password_digest => Digest::SHA1.hexdigest("test#{salt}"), :role => "player", :status => "alive")
    princess.game = game1
    princess.save(:validate => false)

    kat.update(assassin: emily, target: princess)
    emily.update(assassin: bradley, target: kat)
    bradley.update(assassin: princess, target: emily)
    princess.update(assassin: kat, target: bradley)

    kat.save(:validate => false)
    emily.save(:validate => false)
    bradley.save(:validate => false)
    princess.save(:validate => false)
  end

  def down
      User.delete_all
      Game.delete_all
  end
end
