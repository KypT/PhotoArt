class AdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    @albums = Album.all
  end

  private
  def authenticate_admin!
    authenticate_user!
    not_found unless current_user.admin?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end