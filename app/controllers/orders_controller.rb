class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.where(state: 'paid')
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    @order = Order.create(user: current_user, state: 'pending')
    redirect_to new_order_order_detail_path(@order)
  end
end
