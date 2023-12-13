class ProfilesController < ApplicationController
  load_and_authorize_resource

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end
end
