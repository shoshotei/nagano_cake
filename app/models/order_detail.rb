class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: {not_available: 0, awaiting_production: 1, under_manifacture: 2, completed_production: 3}
end
