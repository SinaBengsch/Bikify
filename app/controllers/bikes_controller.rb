# frozen_string_literal: true

# Description/Explanation of BikesController
class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end
end
