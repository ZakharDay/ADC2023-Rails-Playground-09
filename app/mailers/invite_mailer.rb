class InviteMailer < ApplicationMailer

  def send_link
    email = params[:invite][:email]
    token = params[:invite][:token]
    @invite_url = "http://localhost:3000/users/sign_up?token=#{token}"
    mail(to: email, subject: "Вас пригласили")
  end

end
