class SessionsController < ApplicationController
  
  def new
    redirect_to '/auth/facebook'
  end
  
  def create
    auth = request.env["omniauth.auth"]
    if !User.where(:uid => auth['uid']).first.nil?
      user = User.where(:uid => auth['uid']).first
      session[:current_user_id] = user.id
    else
      user = User.create_with_omniauth(auth)
      session[:current_user_id] = user.id
      UserMailer.welcome_email(user).deliver
    end
    redirect_to root_url, :notice => "Signed in!"
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
