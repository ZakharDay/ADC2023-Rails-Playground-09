class Admin::ApplicationController < ApplicationController
  load_and_authorize_resource
  before_action :check_admin

  def check_admin
    redirect_to root_path unless current_user.admin
  end
end