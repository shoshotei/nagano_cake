class Public::OrdersController < ApplicationController

  def new
    @order  = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if params[:order][:address_select] == "current_customer_address"
   
    elsif params[:order][:address_select] == "registered_customer_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    
    elsif params[:order][:address_select] == "new_customer_address"
      
    end
  end

  def conpletion
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
