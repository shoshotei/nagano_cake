class CartItem < ApplicationRecord
  belongs_to :item
　belongs_to :customer

  def subtotal
    this.item.with_tax_price * this.amount
  end

end
