class AdminController < ApplicationController
	before_action :authenticate_user!
  before_action :check_if_admin

  def index
  end

  private

  def redirect_to_root
    redirect_to events_path
  end

  def check_if_admin
    redirect_to_root if !current_user.is_admin
  end
end
