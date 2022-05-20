class Admin::OrdersController < ApplicationController

  def show
    @orders = Order.page(params[:page])
  end

  def update
  end

end
