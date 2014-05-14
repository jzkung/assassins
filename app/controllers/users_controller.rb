class UsersController < ApplicationController
  def new
    @user = User.find_by(login: "jessica")
    #UserMailer.welcome_email(@user).deliver
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]

    @user.last_name = params[:user][:last_name]
    @user.created_at = DateTime.now.utc
    @user.updated_at = DateTime.now.utc
    @user.email = params[:user][:email]
    @user.login = params[:user][:login]
    @user.phone_number = params[:user][:phone_number]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.role = "player"
    @user.status = "alive"
    if @user.save then
      UserMailer.welcome_email(@user).deliver
      redirect_to controller: :users, action: :login
    else
      render "new"
    end
  end

  def post_login
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
