class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  after_validation :calculate_total_price


  def calculate_total_price
    num_of_days = (end_date - start_date).to_i

    self.total_price = (num_of_days * bike.price_per_day) / 24
  end
end
