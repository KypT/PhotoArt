class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def edit
    @photos = @album.photos.order(:sort)
    @photos = {} unless @photos
  end

  def new
    @album = Album.new
  end

  def show
    id = params[:id]
    @photos = Album.find(id).photos
    render :layout => false
  end

  def create
    @album = Album.new(album_params)
    @photos = {}

      if @album.save
        render :edit
      else
        render :new, alert: 'Название альбома не может отсутствовать'
      end
  end

  def destroy
    @album.destroy
    redirect_to admin_path, notice: 'Альбом удален.'
  end

  def update

    result = @album.update(album_params)

    if request.xhr?
      if result
        render json: :ok
      else
        render json: :error
      end
      return
    end


    if result
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
      params.require(:album).permit(:name, :cover)
    end
end
