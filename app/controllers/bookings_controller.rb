class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
      @bike = Bike.find(params[:bike_id])
      @booking.bike = @bike
      if @booking.save
        # redirect_to bike_path(@booking.bike)
      else
        render 'bikes/show' # render 'gardens/show.html.erb'
      end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id, :status, :start_date, :end_date, :total_price)
  end
end
