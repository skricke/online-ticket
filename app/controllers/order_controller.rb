class OrderController < ApplicationController
  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
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
