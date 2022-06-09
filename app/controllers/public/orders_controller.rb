class Public::OrdersController < ApplicationController

  def new
    @order  = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if params[:order][:address_select] == "current_customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_select] == "registered_customer_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_select] == "new_customer_address"
      @order.postal_code = new.postal_code
      @order.address = new.address
      @order.name = new.name
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
