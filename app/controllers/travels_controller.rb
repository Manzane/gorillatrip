class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = current_user.travels.all
    @user = current_user
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
      date_update = TravelDateUpdater.new(@travel)
      if date_update.save
        # binding.pry
        vp = VaccineProgressionTConstructor.new(@travel.travel_countries, @travel)
        if vp.save
          redirect_to travel_path(@travel), notice: 'Le voyage a bien été créé.'
        end
      else
        date_update.errors.full_messages
      end
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
      date_update = TravelDateUpdater.new(@travel)
      if date_update.save
        redirect_to travel_path(@travel), notice: 'Le voyage a bien été mis à jour.'
      else
        date_update.errors.full_messages
      end
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

  def travel_params
    params.require(:travel).permit(:name, travel_countries_attributes: [:id, :start_date, :end_date, :country_id], countries_attributes: [:id] )
  end

end
