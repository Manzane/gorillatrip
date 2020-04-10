class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = current_user.travels.all
  end

  def show
  end

  def new
    @travel = Travel.new
    @travel.travel_countries.build
    @travel.countries.build
    @countries = Country.all
    @continents = Continent.all
  end


  def create
    creator = TravelCreator.new(travel_params, current_user)
    if creator.save
      @travel = creator.travel
      set_dates(@travel)
      @travel.travel_start_date = @first_date
      @travel.travel_end_date = @last_date
      @travel.save!
      redirect_to travel_path(@travel)
    else
      creator.errors.full_messages
        render :new
    end
  end

  def edit
    @countries = Country.all
    @continents = Continent.all
  end

  def update
    updater = TravelUpdater.new(set_travel, travel_params, current_user)
    if updater.save
      @travel = updater.travel
      set_dates(@travel)
      @travel.update!(travel_start_date: @first_date, travel_end_date: @last_date)
      redirect_to travel_path(@travel), notice: 'Le voyage a bien été mis à jour.'
    else
      updater.errors.full_messages
    end
  end

  def destroy
    @travel.destroy
    redirect_to travels_path, notice: 'Le voyage a bien été supprimé.'
  end


  private

  def set_travel
    @travel = current_user.travels.find(params[:id])
  end

  def set_dates(travel)
    travel_countries = TravelCountry.where("travel_id = #{travel.id}")
    first_stay = travel_countries.order('start_date ASC').first
    @first_date = first_stay.start_date
    last_stay = travel_countries.order('end_date DESC').first
    @last_date = last_stay.end_date
  end

  def travel_params
    params.require(:travel).permit(:name, travel_countries_attributes: [:id, :start_date, :end_date, :country_id], countries_attributes: [:id] )
  end

end
