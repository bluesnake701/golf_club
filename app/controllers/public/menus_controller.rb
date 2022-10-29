class Public::MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

   private

  def menu_params
    params.require(:menu).permit(:menu_genre_id, :name, :introduction, :price, :is_active)
  end
end
