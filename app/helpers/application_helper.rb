module ApplicationHelper
  def cart_item_count
    cart = Cart.find_by(id: session[:cart_id])
    cart ? cart.line_items.count : 0
  end
end