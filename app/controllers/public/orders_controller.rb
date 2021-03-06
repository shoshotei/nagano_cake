class Public::OrdersController < ApplicationController

  def new
    @order  = Order.new
    @cart_items = current_customer.cart_items.all
    if @cart_items.count == 0

      redirect_to cart_items_path
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if params[:order][:address_select] == "current_customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_select] == "registered_customer_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_select] == "new_customer_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def conpletion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price_including_tax = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to conpletion_orders_path
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:shipping_cost, :payment_method, :postal_code, :address, :name, :status, :total_payment)
  end

end
