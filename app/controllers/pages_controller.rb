class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @bikes = current_user.bikes
    bookings = current_user.bookings.partition do |booking|
      booking.start_date >= Date.today
    end
    @upcoming = bookings.last
    @past = bookings.first
  end
end
