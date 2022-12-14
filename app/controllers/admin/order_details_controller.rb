class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:order_id])
    @order_detail.update(order_detail_params)
    @order_detail.save
    redirect_to  admin_order_path(@order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :shipping_status)
  end
end
