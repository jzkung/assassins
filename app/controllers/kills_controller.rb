class KillsController < ApplicationController
  
  def new
    @kill = Kill.new
  end

  def history
    if !session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
      @kills = Kill.where(:assassin => @current_user).reverse_order
    end
    @message = Message.new
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
        @kill.lat = params[:lat]
        @kill.lng = params[:lng]
        @kill.game = @current_user.game
        @kill.description = params[:kill][:description]
        if @kill.save(:validate => false) then
          @current_user.term_date = DateTime.now.in(86400)
          @current_user.target.status = "dead"
          @current_user.target.save(:validate => false)
          @current_user.update(target: @current_user.target.target)
          @current_user.save(:validate => false)
          @current_user.target.update(assassin: @current_user)
          @current_user.target.save(:validate => false)
          if (@current_user.target == @current_user) then
            @current_user.game.has_ended = true
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

  def terminate
    @term_user = User.find(params[:id])
    @admin = User.find(session[:current_user_id])
    @term = Kill.new
    @term.assassin = @admin
    @term.target = @term_user
    @term.time_killed = DateTime.now
    @term.lat = params[:lat]
    @term.lng = params[:lng]
    @term.game = @term_user.game
    @term.description = "Terminated."
    @term.save(:validate => false)
    @term_user.target.update(assassin: @term_user.assassin)
    @term_user.target.save(:validate => false)
    @term_user.assassin.update(target: @term_user.target)
    @term_user.assassin.save(:validate => false)
    @term_user.status = "dead"
    @term_user.save(:validate => false)
    @term_user.game.num_alive = @term_user.game.num_alive - 1
    @term_user.game.save(:validate => false)

    if (@term_user.game.num_alive == 1) then #where is num_alive?
      @winner = @term_user.target
      @term_user.game.has_ended = true
      @term_user.game.save(:validate => false)
      UserMailer.win_email(@winner).deliver
    else
      UserMailer.term_target(@term_user.assassin, @term).deliver
    end
    @term_user.game.save(:validate => false)
    UserMailer.terminated(@term_user).deliver
  end

end
