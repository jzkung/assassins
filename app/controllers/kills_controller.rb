class KillsController < ApplicationController
  
  def new
    @kill = Kill.new
  end

  def history
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      @kills = Kill.where(:assassin => @current_user)
    end
  end

  def post_report
    @kill = Kill.new
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      if params[:kill][:code].blank?
        @kill.errors.add(:login, ": You need to input a kill code to report a kill")
        render "report"
      elsif !@current_user.target.valid_kill_code?(params[:kill][:code])
        @kill.errors.add(:code, ": Incorrect kill code")
        render "report"
      else
        @kill.target = @current_user.target
        @kill.assassin = @current_user
        @kill.code = params[:kill][:code]
        @kill.time_killed = DateTime.now.utc
        if @kill.save then
          redirect_to controller: :kills, action: :history
        else
          @kill.errors.add(:code, ": Incorrect kill code")
          render "report"
        end
      end
    else
      @kill.errors.add(:code, ": You need to log in to report kills!")
      render "report"
    end
  end

  def report
    @kill = Kill.new
  end
end
