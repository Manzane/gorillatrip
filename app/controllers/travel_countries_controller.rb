class TravelCountriesController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]
  before_action :set_travel

  def show
  end

  def new
    @travel_country = TravelCountry.new
    # @stay.countries.build
    @countries = Country.all
  end


  def create
    @travel_country = TravelCountry.new(stay_params)
    @travel_country.travel_id = @travel.id
    if @travel_country.save
      redirect_to travel_path(@travel)
    else
      @travel_country.errors.full_messages
        render :new
    end
  end

  def edit
    @countries = Country.all
  end

  def update
    @stay.update(stay_params)
    if @stay.save
    redirect_to travel_path(@travel), notice: 'La destination a bien été mis à jour.'
    else
      updater.errors.full_messages
    end
  end

  def destroy
    @stay.destroy
    redirect_to travel_path(@travel), notice: 'La destination a bien été supprimé.'
  end


  private

  def set_travel
    @travel = Travel.find(params[:travel_id])
  end

  def set_stay
    @stay = TravelCountry.find(params[:id])
  end

  def stay_params
    params.require(:travel_country).permit(:start_date, :end_date, :country_id)
  end

end
