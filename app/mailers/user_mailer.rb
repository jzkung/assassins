class UserMailer < ActionMailer::Base
  default from: "jro.assassins@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Welcome to Assassins!")
  end

  def game_welcome(game, user)
  	@user = user
    @game = game
  	mail(to: @user.email, subject: "You Signed Up for a Game")
  end

  def game_start(game, user)
  	@user = user
    @game = game
  	mail(to: @user.email, subject: "Assassins has Begun!")
  end

  def kill_confirm(kills, user)
  	@user = user
  	@kills = kills
  	mail(to: @user.email, subject: "Your New Assignment")
  end

  def win_email(user)
  	@user = user
  	mail(to: @user.email, subject: "You Won!!")
  end

  def terminated(user)
    @user = user
    mail(to: @user.email, subject: "You Have Been Terminated")
  end

  def term_target(user, kills)
    @user = user
    @kills = kills
    mail(to: @user.email, subject: "You Target has been Terminated: New Target")
  end

end
