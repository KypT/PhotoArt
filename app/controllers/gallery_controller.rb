class GalleryController < ApplicationController

  def show
    @album = Album.find(params[:id])
    @page_title = 'Всеволод Тоботрас. Просмотр галереи фотографий из альбома ' + @album.name
    render layout: 'gallery'
  end

  def index
    @page_title = 'Всеволод Тоботрас. Просмотр альбомов галереи'
    @albums = Album.all
    render layout: 'application'
  end
end
