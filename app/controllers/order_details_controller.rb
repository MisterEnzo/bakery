class OrderDetailsController < ApplicationController
  before_action :set_order, only: [ :new, :create ]

  def new
  end

  def create
    cookies = params[:details][:cookies_q].to_i
    brownies = params[:details][:brownies_q].to_i
    cakes = params[:details][:cakes_q].to_i
    if cookies > 0
      @order.order_details.create!(quantity: cookies, menu_item_id: 1,
                                   sub_total_cents: MenuItem.first.price_cents * cookies)
    end
    if brownies > 0
      @order.order_details.create!(quantity: brownies, menu_item_id: 2,
                                   sub_total_cents: MenuItem.second.price_cents * brownies)
    end
    if cakes > 0
      @order.order_details.create!(quantity: cakes, menu_item_id: 3,
                                   sub_total_cents: MenuItem.third.price_cents * cakes)
    end
    total = 0
    @order.order_details.each do |detail|
      total += detail.sub_total_cents.to_i
    end
    @order.update_attribute(:amount_cents, total)
    redirect_to new_order_payment_path(@order)
    # redirect_to new_order_payment_path(order)

  end

private
  def order_details
    params.require(:details).permit(:cookies_q, :brownies_q, :cakes_q)
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
