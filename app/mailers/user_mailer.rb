class UserMailer < ActionMailer::Base
  default from: "noreply@timeapp-c9-matheaw.c9.io"
  
  
  def welcome_email(user)
      @user = user
      @url = sign_in_url
      mail( to: user.email, subject: 'Thanks for registering')
  end
  
  
  
  
  
end
