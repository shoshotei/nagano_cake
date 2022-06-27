class Order < ApplicationRecord
    has_many :order_details
    belongs_to :customer
    enum payment_method: {credit_card: 0, transfer: 1}
    enum status: {awaiting_payment: 0, payment_confirmation: 1, under_manifacture: 2, preparing_to_ship: 3, already_shipped: 4}
end
