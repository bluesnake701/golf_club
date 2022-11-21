class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to admin_menu_path(@menu.id)
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    if @menu.save
      redirect_to admin_menu_path(@menu.id)
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_genre_id, :name, :introduction, :price, :is_active)
  end
end
