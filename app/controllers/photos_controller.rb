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
    Photo.create(photo_params)

    render json: {ok: :ok}
  end

  def destroy
    @photo.destroy
    render json: {ok: :ok}
  end

  def update
    @photo.update(photo_params)
    render json: {status: :ok}
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
      params.permit(:album_id, :name, :file, :id, :sort)
    end
end