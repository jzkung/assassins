class KillsController < ApplicationController
  
  def new
    @kill = Kill.new
  end

  def history
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      @kills = @current_user.kills
    end
  end

  def create
      if !session[:current_user_id].nil?
        @kill = Kill.new
        @current_user = User.find(session[:current_user_id])
        #@kill.update(target: @current_user.target);
        #@kill.save(:validate => false)
        @kill.target = @current_user.target
        @kill.user = @current_user
        @kill.code = params[:kill][:code]
        @kill.verified = false
        # Not yet @kill.location = params[:kill][:location]
        # I don't think we need this? @kill.deadline =
        @kill.time_killed = DateTime.now.utc
        if @kill.save then
          redirect_to controller: :users, action: :index
        else
          render "new"
        end
      else
        @kills.errors.add(login: ": You need to input a kill code to report a kill")
      end

  end

  def report
    @kill = Kill.new
  end

  def post_report
    @kill = Kill.new
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      @target = @current_user.target
      if params[:kill][:code].blank?
        @kills.errors.add(login: ": You need to input a kill code to report a kill")
      end
      if !@target.valid_kill_code?(params[:kill][:code])
        @kills.errors.add(code: ": Incorrect Kill Code")
      else
        @kill.verified = true
        @nxt_target = @current_user.target.target
        @current_user.update(target: @nxt_target)
        @current_user.save(:validate => false)
        @nxt_target.update(assassin: @current_user)
        @nxt_target.save(:validate => false)
        @current_user.target.update(status: "dead")
        @current_user.target.save(:validate => false)
        # How do we want to represent the killed person's user stuff
      end
    else
      @user.errors.add(:login, ": You need to be logged in to report a kill")
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
