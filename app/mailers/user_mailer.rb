class UserMailer < ApplicationMailer
  def invite(user)
    @user = user
    mail(to: @user.email, subject: 'Invitation')
  end
end