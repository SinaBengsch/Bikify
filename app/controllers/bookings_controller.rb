class BookingsController < ApplicationController
  require 'time_difference'
  before_action :set_bike, only: [:create, :new]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    @booking.status = 'pending'
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 'accept'
    @booking.save

    # uncomment below code if page exists
    # redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = 'decline'
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:bike_id, :status, :start_date, :end_date, :total_price)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
