class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    authorize @order
  end

  def create
    @order = Order.create(user: current_user, state: 'pending')
    authorize @order
    redirect_to new_order_order_detail_path(@order)
  end
end
