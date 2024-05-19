class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    existing_booking = Booking.find_by(booking_params.slice(:first_name, :last_name, :phone, :email, :start_time, :hours))

    if existing_booking
      flash[:alert] = "A booking with the same details already exists."
      redirect_to existing_booking
    else
      @booking = Booking.new(booking_params)
      @booking.calculate_total_time
      if @booking.save
        BookingMailer.booking_confirmation(@booking).deliver_now

        redirect_to @booking
      else
        render 'new'
      end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    existing_booking = Booking.where.not(id: @booking.id).find_by(booking_params.slice(:first_name, :last_name, :phone, :email, :start_time, :hours))

    if existing_booking
      flash[:alert] = "A booking with the same details already exists."
      redirect_to existing_booking
    else
      @booking.assign_attributes(booking_params)
      @booking.calculate_total_time
      if @booking.save
        redirect_to @booking
      else
        render 'edit'
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :phone, :email, :start_time, :hours)
  end
end
