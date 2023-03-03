class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  before_save :calculate_duration

  private

  def calculate_duration
    self.duration = (end_date - start_date).to_i
  end
end
