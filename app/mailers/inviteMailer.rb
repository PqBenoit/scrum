class InviteMailer < ActionMailer::Base
  default from: "contact@fightglad.herokuapp.com"

  def send_invite(email)
    @email = email
    mail(to: @email, subject: 'VENEZ JOUER !')
  end
end
