class UserMailer < ActionMailer::Base
  default from: 'no-reply@example.com'
 
  def welcome_email(receivable, subject, content)
    @user = receivable.user
    @url  = 'http://example.com/login'
    @receivable = receivable
    @content = content
    mail(to: @receivable.email, from: @user.email, subject: subject)
  end
end
