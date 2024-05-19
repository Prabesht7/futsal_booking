class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shopping

  def total_price
    shopping.price * quantity
  end
end