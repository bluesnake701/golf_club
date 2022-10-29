class Public::ReservesController < ApplicationController
  def new
    @plan = Plan.find(params[:plan_id])
    @reserf = Reserf.new
  end

  def confirm
    @plan = Plan.find(params[:reserf][:plan_id])
    #binding.pry
    @reserf = Reserf.new(reserf_params)
    @plans = Plan.where(customer_id: current_customer.id)
  end

  def complete
    @reserf = Reserf.new
    @reserf = Reserf.new(reserf_params)
    @reserf.save!
  end

  def create
    @reserf = Reserf.new(reserf_params)
    @reserf.save
    redirect_to complete_path
  end

  def index
    @reserves = Reserf.all
  end

  def show
    @reserf = Reserf.find(params[:id])
  end

  def update
    @reserf = Reserf.find(params[:id])
    @reserf.update(reserf_params)
    @reserf.save
    redirect_to admin_reserf_path(reserf.id)
  end

  private

  def reserf_params
    params.require(:reserf).permit(:customer_id, :plan_id, :reserves_status, :start)
  end
end