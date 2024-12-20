class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :shoppings, through: :order_items

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
end