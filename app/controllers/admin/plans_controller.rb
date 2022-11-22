class Admin::PlansController < ApplicationController
  def index
    @plans = Plan.page(params[:page])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to admin_plan_path(@plan.id)
    else
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    if @plan.save
      redirect_to admin_plan_path(@plan.id)
    else
      render :edit
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:reserves_id, :plan_name, :player, :start, :price, :round, :lunch, :cart, :caddy, :lodging)
  end
end
