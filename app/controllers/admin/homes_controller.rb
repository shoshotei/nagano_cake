class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:])
  end
end
