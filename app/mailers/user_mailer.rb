class UserMailer < ActionMailer::Base
  default from: "default@example.com"

  def welcome_email(user)
    @user = user
    # Is this necessary @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
