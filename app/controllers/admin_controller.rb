class AdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    @albums = Album.all
  end
end