class Admin::InstitutionsController < ApplicationController
  def new
    @institution = Institution.new
  end

  def index
    @institutions = Institution.all
  end

  def create
    @institution = Institution.new(institution_params)
    @institution.save
    redirect_to admin_institution_path(@institution.id)
  end

  def show
    @institution = Institution.find(params[:id])
  end

  def edit
    @institution = Institution.find(params[:id])
  end

  def update
    @institution = Institution.find(params[:id])
    @institution.update(institution_params)
    @institution.save
    redirect_to admin_institution_path(@institution.id)
  end

  private

  def institution_params
    params.require(:institution).permit(:name, :introduction)
  end
end
