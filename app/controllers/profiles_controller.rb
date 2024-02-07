class ProfilesController < ApplicationController
  load_and_authorize_resource

  def show
    @profile = Profile.find(params[:id])
    @invites = @profile.user.invites.left
    @invites_left = @invites.count
    @invite = @invites.first
  end

  def edit
    @profile = Profile.find(params[:id])
  end
end
