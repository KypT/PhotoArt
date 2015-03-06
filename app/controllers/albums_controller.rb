class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def edit
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

      if @album.save
        render :edit
      else
        render :new, alert: 'Название альбома не может отсутствовать'
      end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Альбом удален.'
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: 'Альбом успешно обновлен.'
    else
        render :edit
    end
  end

  private
    def set_album
      begin
        @album = Album.find(params[:id])
      rescue
        @album = Album.new
        flash.alert = 'Ошибка: некорректный индекс'
      end
    end

    def album_params
      params.require(:album).permit(:name)
    end
end
