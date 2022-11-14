class Admin::InstitutionsController < ApplicationController
  def new
    @institution = Institution.new
  end

  def index
    @institutions = Institution.all
  end

  def create
    @institution = Institution.new(institution_params)
    if @institution.save
      redirect_to admin_institution_path(@institution.id)
    else
      render :new
    end
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
    if @institution.save
      redirect_to admin_institution_path(@institution.id)
    else
      render :edit
    end
  end

  private

  def institution_params
    params.require(:institution).permit(:name, :introduction)
  end
end
