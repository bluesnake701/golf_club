class Public::InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  def show
    @institution = Institution.find(params[:id])
  end

  private

  def institution_params
    params.require(:institution).permit(:name, :introduction)
  end
end
