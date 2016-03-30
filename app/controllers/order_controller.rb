class OrderController < ApplicationController
  def index
    @venue = Venue.find(params[:venue_id])
    event = @venue.event.find(params[:event_id])
    @orders = event.order.all
  end

  def show
    @venue = Venue.find(params[:venue_id])
    event = @venue.event.find(params[:event_id])
    @order = event.order.find(params[:id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    event = @venue.event.find(params[:event_id])
    @order = event.order.new
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    event = @venue.event.find(params[:event_id])
    @order = event.order.find(params[:id])
  end

  def create
    @venue = Venue.find(params[:venue_id])
    event = @venue.event.find(params[:event_id])
    @order = event.order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :edit
    end
  end

  def update
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name, :surname, :amount)
  end
end
