class GalleryController < ApplicationController

  def slideshow
    @album = Album.find(params[:album])
    @page_title = 'Всеволод Тоботрас. Просмотр галереи фотографий из альбома ' + @album.name
    render layout: 'gallery'
  end

  def index
    @page_title = 'Всеволод Тоботрас. Просмотр альбомов галереи'
    @albums = Album.all
    render layout: 'application'
  end
end
