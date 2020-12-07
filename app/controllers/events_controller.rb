class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # byebug
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.save
    if @event.save
      byebug
      redirect_to @event, notice: "Your event was created"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :desc)
  end
end
