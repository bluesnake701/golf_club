class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.page(params[:page])
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.page(params[:page])
      render :index
    end
  end


  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :destination)
  end
end
