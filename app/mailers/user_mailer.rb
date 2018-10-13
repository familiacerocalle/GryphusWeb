class UserMailer < ApplicationMailer

  def unblock_request_to_admins(user_id)
    @user = User.find(user_id)
    mail(to: User::ADMIN_EMAIL, subject: 'Unblock My account', from: @user.email)
  end

end
