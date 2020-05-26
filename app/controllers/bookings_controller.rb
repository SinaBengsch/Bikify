class BookingsController < ApplicationController
  require 'time_difference'
before_action :set_bike, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    @booking.status = "pending"
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
