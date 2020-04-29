class TravelCountriesController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]
  before_action :set_travel

  def show
  end

  def new
    @travel_country = TravelCountry.new
    # @stay.countries.build
    @countries = Country.all
    @continents = Continent.all
  end


  def create
    @travel_country = TravelCountry.new(stay_params)
    @travel_country.travel_id = @travel.id
    if @travel_country.save
      date_update = TravelDateUpdater.new(@travel)
      if date_update.save
        vp = VaccineProgressionConstructor.new(@travel_country, @travel)
        if vp.save
          redirect_to travel_path(@travel)
        else
          vp.errors.full_messages
        end
      else
        date_update.errors.full_messages
      end
    else
      @travel_country.errors.full_messages
        render :new
    end
  end

  def edit
    @countries = Country.all
    @continents = Continent.all
  end

  def update
    @stay.update(stay_params)
    if @stay.save
      date_update = TravelDateUpdater.new(@travel)
      if date_update.save
        redirect_to travel_path(@travel), notice: 'La destination a bien été mis à jour.'
      else
        date_update.errors.full_messages
      end
    else
      @stay.errors.full_messages
    end
  end

  def destroy
    @stay.destroy
    if !@travel.travel_countries.empty?
      date_update = TravelDateUpdater.new(@travel)
      if date_update.save
        redirect_to travel_path(@travel), notice: 'La destination a bien été supprimé.'
      else
        date_update.errors.full_messages
      end
    else
      redirect_to travel_path(@travel), notice: 'La destination a bien été supprimé.'
    end
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

  def set_dates(travel)
    travel_countries = TravelCountry.where("travel_id = #{travel.id}")
    first_stay = travel_countries.order('start_date ASC').first
    @first_date = first_stay.start_date
    last_stay = travel_countries.order('end_date DESC').first
    @last_date = last_stay.end_date
  end

end
