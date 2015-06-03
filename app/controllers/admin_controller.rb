class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = Album.all
  end
end
