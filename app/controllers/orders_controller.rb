class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.where(state: 'paid')
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    order = Order.create!(menu_item_sku: menu_item.sku, amount: menu_item.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
  end
end
