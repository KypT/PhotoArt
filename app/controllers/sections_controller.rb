class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]

  def index
    @sections = Section.all
  end

  def edit
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to sections_path, notice: 'Секция успешно создана.'
    else
      render :new
    end
  end

  def destroy
    @section.destroy
    redirect_to sections_path, notice: 'Секция удалена.'
  end

  def update
    if @section.update(section_params)
      redirect_to sections_path, notice: 'Секция успешно обновлена.'
    else
      render :edit
    end
  end

  private
  def set_section
    begin
      @section = Section.find(params[:id])
    rescue
      @section = Section.new
      flash.alert = 'Ошибка: некорректный индекс'
    end
  end

  def section_params
    params.require(:section).permit(:name, :url)
  end
end
