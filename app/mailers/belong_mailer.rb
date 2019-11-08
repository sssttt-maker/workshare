class BelongMailer < ApplicationMailer
  def invite_mail(user, organization)
    @user = user
    @organization = organization
    mail to: user.email, subject: "invite organization"
  end
end
