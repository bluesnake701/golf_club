class Admin::MenuGenresController < ApplicationController
  def index
    @menu_genre = MenuGenre.new
    @menu_genres = MenuGenre.all
  end

  def create
    @menu_genre = MenuGenre.new(menu_genre_params)
    @menu_genre.save
    redirect_to admin_menu_genres_path
  end

  def edit
    @menu_genre = MenuGenre.find(params[:id])
  end

  def update
    @menu_genre = MenuGenre.find(params[:id])
    @menu_genre.update(menu_genre_params)
    @menu_genre.save
    redirect_to admin_menu_genres_path
  end

  private

  def menu_genre_params
    params.require(:menu_genre).permit(:name)
  end
end
