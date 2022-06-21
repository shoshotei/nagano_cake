class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    #@customer = Customer.find(params[:id])
    @customer == current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def confirm
  end

  def withdrawal
  end

private
def customer_params
  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address ,:telephone_number, :is_deleted)
end
end
