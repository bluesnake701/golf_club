class Admin::ReservesController < ApplicationController
  def show
    @reserf = Reserf.find(params[:id])
    @plan = @reserf.plan
    @customer = @reserf.customer
  end

  def update
    @reserf = Reserf.find(params[:id])
    @reserf.update(reserf_params)
    @reserf.save!
    redirect_to reserf_path
  end

  private

  def reserf_params
    params.require(:reserf).permit(:customer_id, :plan_id, :reserves_status, :start)
  end
end
