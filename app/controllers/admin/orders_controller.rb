class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    @order_details = OrderDetail.where(order_id: @order.id)
    redirect_to  admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :destination, :name, :shipping_cost, :grand_total, :payment_method, :status)
  end
end
