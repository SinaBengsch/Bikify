class BookingsController < ApplicationController
  require 'time_difference'
  before_action :set_bike, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    @booking.bike = @bike
    @booking.status = 'pending'
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:bike_id, :status, :start_date, :end_date, :total_price)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
