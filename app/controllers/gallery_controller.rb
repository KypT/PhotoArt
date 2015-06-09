class GalleryController < ApplicationController

  def slideshow
    @albums = Album.all
    id = params[:album]
    @album = Album.find(id)
    render layout: 'gallery'
  end

  def index
    @albums = Album.all
    render layout: 'application'
  end
end
