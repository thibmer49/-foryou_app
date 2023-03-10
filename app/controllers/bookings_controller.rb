class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[new create]
  def show
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    @booking.total_price = (@booking.end_date - @booking.start_date + 1).to_i * @offer.price_per_day
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :offer_id, :start_date, :end_date, :duration)
  end
end
