class UserMailer < ActionMailer::Base
  default from: "jro.assassins@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Welcome to Assassins!")
  end

  def game_welcome(game, user)
  	@user = user
  	@game = game
  	mail(to: @user.email, subject: "You've Signed Up for a Game")
  end

  def kill_confirm(kills, user)
  	@user = user
  	@kills = kills
  	mail(to: @user.email, subject: "You're New Assignment")
  end

  def win_email(user)
  	@user = user
  	mail(to: @user.email, subject: "You've Won!!")
  end

end
