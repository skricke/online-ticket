class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    #@venue = Venue.find(params[:venue_id])
    #@event = @venue.event.find(params[:id])
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    #@venue_id
    #@venue = Venue.new
  end

  def edit
    #@venue = Venue.find(params[:venue_id])
    #@event = @venue.event.find(params[:id])
  end

  def create
    #venue_id = params[:event][:venue]
    #if venue_id == ""
   #   render :new
   # else
    #  @venue = Venue.find(venue_id)
    #end

    #@event = @venue.events.create(event_params)  #@venue.event.new(event_params)
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
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
