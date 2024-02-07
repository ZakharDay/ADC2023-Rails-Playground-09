class InvitesController < ApplicationController
  load_and_authorize_resource

  def update
    @invite = Invite.find(params[:id])
    token = SecureRandom.hex(128)

    respond_to do |format|
      if @invite.update({email: params[:invite][:email], token: token})
        InviteMailer.with(invite: @invite).send_link.deliver_now

        format.html { redirect_to profile_url(current_user.id), notice: "Invite was successfully sent" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

end
