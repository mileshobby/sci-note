class UserMailer < ApplicationMailer
  def welcome_email(user)
    default from: 'miles@example.com'
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
