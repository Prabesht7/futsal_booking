class ShoppingMailer < ApplicationMailer
  def cart_deleted_notification(user_email)
    mail to: user_email, subject: "Your Cart Has Been Deleted"
  end
end
