class Admin::MenuGenresController < ApplicationController
  def index
    @menu_genre = MenuGenre.new
    @menu_genres = MenuGenre.page(params[:page])
  end

  def create
    @menu_genre = MenuGenre.new(menu_genre_params)
    if @menu_genre.save
      redirect_to admin_menu_genres_path
    else
      @menu_genres = MenuGenre.page(params[:page])
      render :index
    end
  end

  def edit
    @menu_genre = MenuGenre.find(params[:id])
  end

  def update
    @menu_genre = MenuGenre.find(params[:id])
    @menu_genre.update(menu_genre_params)
    if @menu_genre.save
      redirect_to admin_menu_genres_path
    else
      render :edit
    end
  end

  private

  def menu_genre_params
    params.require(:menu_genre).permit(:name)
  end
end
