class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

   private

  def item_params
    params.require(:item).permit(:item_genre_id, :name, :introduction, :price, :is_active)
  end
end
