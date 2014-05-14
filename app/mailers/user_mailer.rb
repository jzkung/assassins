class UserMailer < ActionMailer::Base
  default from: "jro.assassins@gmail.com"

  def welcome_email
  	mail(to: "jzkung@gmail.com", subject: "test")
  end

end
