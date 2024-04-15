class LineItem < ApplicationRecord
  belongs_to :shopping
  belongs_to :cart

  def total_price
    shopping.price.to_i * quantity.to_i
  end
end
