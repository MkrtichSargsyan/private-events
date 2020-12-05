class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title, :datetime, :location, :desc)
  end
end
