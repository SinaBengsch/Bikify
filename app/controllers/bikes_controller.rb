# frozen_string_literal: true

# Description/Explanation of BikesController
class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bikes_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bikes_path
    else
      render :new
    end
  end

  private

  def bikes_params
    params.require(:bike).permit(:name, :description, :price_per_day, :location)
  end
end
