class ShoppingMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @user = @order.user
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end

