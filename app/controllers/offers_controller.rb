class OffersController < ApplicationController
  before_action :set_offer, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @offers = policy_scope(Offer)
    if params[:jardin_exterieur]
      @offers = @offers.where(category: "Jardin/Extérieur")
    elsif params[:babysitting]
      @offers = @offers.where(category: "Baby-sitting/Garde d'enfants")
    elsif params[:dogsitting]
      @offers = @offers.where(category: "Dog-sitting/Garde d'animaux")
    elsif params[:reparation]
      @offers = @offers.where(category: "Réparation/Entretien")
    elsif params[:house]
      @offers = @offers.where(category: "Maison/Décoration")
    elsif params[:party]
      @offers = @offers.where(category: "Animation")
    elsif params[:cook]
      @offers = @offers.where(category: "Traiteur/Service à table")
    elsif params[:query].present?
      @offers = Offer.search_by_name_and_description(params[:query])
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
  end

  def show
    authorize @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
    authorize @offer
  end

  def new
    @offer = Offer.new
    @offer.user = current_user
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
    authorize @offer
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:price_per_day, :name, :description, :category, :address, :beginning_date, :end_date, :photo)
  end
end
