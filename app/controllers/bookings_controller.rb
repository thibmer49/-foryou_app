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
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end
