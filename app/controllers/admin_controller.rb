class AdminController < ApplicationController
  def index
    @albums = Album.all
  end
end
