class OrderController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    tickets = 0
    @event.orders.each do |t|
      if t.amount != nil
        tickets += t.amount
      end
    end
    seats = @event.venue.available_seats
    @available_tickets = seats - tickets #- amount
    @order = Order.new
  end

  def edit

  end

  def create
    @event = Event.find(params[:order][:event_id])
    tickets = 0
    @event.orders.each do |t|
      if t.amount != nil
        tickets += t.amount
      end
    end
    seats = @event.venue.available_seats
    @available_tickets = seats - tickets
    @order = @event.orders.build(order_params)

    #if @available_tickets - @order.amount >= 0
      if @order.save
        redirect_to @order
      else
        render :new
      end
    #else
    #  render :new
    #end

  end

  def update
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:name, :surname, :amount, :event_id)
  end
end
