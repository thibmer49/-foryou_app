class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @offers = Offer.all.sample(3)
  end

  def dashboard
    @bookings = current_user.bookings
    @offers = current_user.offers
    @bookings_requests = Booking.all.select { |booking| booking.offer.user == current_user }
  end
end
