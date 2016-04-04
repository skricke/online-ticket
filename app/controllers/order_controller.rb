class OrderController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    #@order = Order.new
  end

  def edit

  end

  def creates
    @event = Event.find(params[:order][:event_id])
    @order = @event.orders.build(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name, :surname, :amount, :event_id)
  end
end
