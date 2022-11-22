class Public::PlansController < ApplicationController
  def index
    @plans = Plan.page(params[:page])
  end


  def show
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:reserves_id, :plan_name, :player, :start, :price, :round, :lunch, :cart, :caddy, :lodging)
  end
end
