class GalleryController < ApplicationController

  def slideshow
    @albums = Album.all
    id = params[:album]
    @album = Album.find(id)
  end

  def index
    @albums = Album.all
  end
end
