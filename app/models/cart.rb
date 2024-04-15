class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_shopping(shopping)
    current_item = line_items.find_by(shopping_id: shopping.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(shopping_id: shopping.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end
end
