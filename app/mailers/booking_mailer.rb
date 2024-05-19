class BookingMailer < ApplicationMailer
  def booking_confirmation(booking)
    @booking = booking
    mail to: @booking.email, subject: "Booking Confirmation"
  end

  def booking_notification(admin, booking)
    @admin = admin
    @booking = booking
    mail to: admin.email, subject: "New Booking Created"
  end
end