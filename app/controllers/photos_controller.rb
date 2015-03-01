class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :update, :destroy]
  before_action :load_albums, only: [:edit, :new, :index]

  def index
    @photos = Photo.all
  end

  def edit
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(article_params)

    if @photo.save
      redirect_to photos_path, notice: 'Новость добавлена.'
    else
      render :new
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: 'Новость удалена.'
  end

  def update
    if @photo.update(article_params)
      redirect_to photos_path, notice: 'Новость успешно обновлена.'
    else
      render :edit
    end
  end

  private
    def set_photo
      begin
        @photo = Photo.find(params[:id])
      rescue
        @photo = Photo.new
        flash.alert = 'Ошибка: некорректный индекс'
      end
    end

    def load_albums
      @albums = Album.all
    end

    def photo_params
      params.require(:photo).permit(:album_id, :name)
    end
end