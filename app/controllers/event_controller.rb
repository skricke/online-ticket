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
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @event = @venue.event.find(params[:id])
  end

  def create
    @venue = Venue.find(params[:venue => [:venue_id]])
    @event = @venue.event.create(event_params)
    if @event.save
      redirect_to @event
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
    params.require(:event).permit(:title, :description, :price, {:venue => [:venue_id]})
  end
end
