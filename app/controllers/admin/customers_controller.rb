class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
    @customer = Customer.find(params[:id])
  end

  def show
  end

  def edit

  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :is_active)
  end

end
