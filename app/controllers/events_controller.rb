class EventsController < ApplicationController
  before_action :authenticate_user!, only: ['create', 'update', 'destroy', 'edit']
  def index
    @section = params[:section]
    @events = Event.all.where section: @section
    @page_title = 'Всеволод Тоботрас. ' + translate_section(@section)
  end

  def show
    @section = params[:section]
    @event = Event.find(params[:id])
    @page_title = 'Всеволод Тоботрас. ' + @event.title
  end

  def new
    @event = Event.new
    @action = 'create'
  end

  def create
    @event = Event.new(event_params.merge section: params[:section])
    if @event.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
    @action = 'update'
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update event_params
      redirect_to event_path id: @event.id
    else
      render edit_event_path id: @event.id
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :content)
  end

  def translate_section(section)
    {'travel' => 'Фотоэкспедиции', 'photography' => 'Фотосъемка', 'teaching' => 'Фотошкола', }[section]
  end
end
