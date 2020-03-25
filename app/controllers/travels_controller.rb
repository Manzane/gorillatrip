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
  end


  def create
    # params -> { name: '6e7', photos: [photo1, photo2] }
    creator = TravelCreator.new(travel_params, current_user)
    if creator.save
      @travel = creator.travel
      redirect_to travel_path(@travel)
    else
      creator.errors.full_messages
        render :new
    end
  end

  def edit
    @countries = Country.all
  end

  def update
    updater = TravelUpdater.new(set_travel, travel_params, current_user)
    if updater.save
      @travel = updater.travel
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

  def travel_params
    params.require(:travel).permit(:name, :travel_start_date, :travel_end_date, travel_countries_attributes: [:id, :duration], countries_attributes: [:id] )
  end

end
