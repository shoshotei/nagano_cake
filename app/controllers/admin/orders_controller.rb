class Admin::OrdersController < ApplicationController

  def show
    @orders = Order.page(params[:page])
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
  end

private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :status, :created_at)
  end
end
