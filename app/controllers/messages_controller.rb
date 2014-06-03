class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def message_board
    if !session[:current_user_id].nil?
      @messages = Message.all
    end
  end

  def create
    @message = Message.new
    @current_user = User.find(session[:current_user_id])
    @message.player = @current_user
    @message.game = @current_user.game
    @message.content = params[:message][:content]
    @message.deleted = false
    @message.post_date = DateTime.now
    if @message.save then
      redirect_to controller: :messages, action: :message_board
    else
      render "new"
    end
  end
  
  def delete
    @message = Message.find(params[:id])
    @message.deleted = true
    @message.save(:validate => false)
  end
end
