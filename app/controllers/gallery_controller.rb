class GalleryController < ApplicationController
  def index
    @albums = Album.all

    id = params[:album]
    @album = id ? Album.find(id) : @albums.first
  end
end
