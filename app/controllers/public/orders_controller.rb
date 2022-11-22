class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if params[:order][:address_option] == "0"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.destination = @address.destination
      @order.name = @address.name
    end
  end

  def thanks
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.status = 0
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_path
  end

  def index
   @orders = Order.page(params[:page])
   @order = Order.new
   @order_details = OrderDetail.where(order_id: @order.id)
   @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :destination, :name, :shipping_cost, :grand_total, :payment_method, :status)
  end

end
