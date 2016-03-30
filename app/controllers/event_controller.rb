class EventController < ApplicationController
  def index
    @venues = Venue.all
    @events = @venues.event.all
  end

  def show
    @venue = Venue.find(params[:venue_id])
    @event = @venue.event.find(params[:id])
  end

  def new
    @event = Event.new
    @venue = Venue.new
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @event = @venue.event.find(params[:id])
  end

  def create

    @venue = Venue.find(params[:event][:venue])
    @event = @venue.events.create(event_params)  #@venue.event.new(event_params)
    #@venue = Venue.find(params[:event][:venue])
    #@event.venue=@venue

    if event.save
      redirect_to event
    else
      render :edit
    end
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :price, :venue_id)
  end
end
