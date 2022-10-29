class Admin::HomesController < ApplicationController
  def top
    @reserves = Reserf.all
  end

  private

  def reserf_params
    params.require(:reserf).permit(:customer_id, :plan_id, :reserves_status, :start)
  end
end
