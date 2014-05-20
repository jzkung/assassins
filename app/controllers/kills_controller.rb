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
        @kill.assassin = @current_user.target.assassin
        @kill.code = params[:kill][:code]
        @kill.time_killed = DateTime.now
        if @kill.save(:validate => false) then
          @current_user.term_date = DateTime.now.in(86400)
          @current_user.target.status = "dead"
          @current_user.target.save(:validate => false)
          @current_user.update(target: @current_user.target.target)
          @current_user.save(:validate => false)
          @current_user.target.update(assassin: @current_user)
          @current_user.target.save(:validate => false)
          if (@current_user.target == @current_user) then
            UserMailer.win_email(@current_user).deliver
          else
            UserMailer.kill_confirm(@kill, @current_user).deliver
          end
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
