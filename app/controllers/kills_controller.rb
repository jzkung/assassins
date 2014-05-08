class KillsController < ApplicationController
  def history
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      @kills = @current_user.kills
    end
  end

  def report
    @kill = Kill.new
  end

  def post_report
  	@user = User.find_by(login: params[:user][:login])
    if (params[:user][:login].blank?)
      @user = User.new
      @user.errors.add(:login, ": You need to enter a login name! Please try again!")
      render "login"
  	elsif !@user.nil?
      if @user.valid_password?(params[:user][:password])
    		session[:current_user_id] = @user.id
    		redirect_to controller: :users, action: :index
      else
        @user = User.new
        @user.errors.add(:password, ": Your password is wrong! Please try again!")
        render "login"
      end
  	else
      @user = User.new
      @user.errors.add(:login, ": Login name does not exist! Please try again!")
  		render "login"
  	end
  end
  
  def login
    @user = User.new
  end

  def index
  	@users = User.all
    @games = Game.all
  end

  def logout
  	session[:current_user_id] = nil
  	redirect_to controller: :users, action: :login
  end
end
