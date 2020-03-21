class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = current_user.travels.all
  end

  def show
  end

  def new
    @travel = Travel.new
  end


  def create
    # params -> { name: '6e7', photos: [photo1, photo2] }
    creator = TravelCreator.new(params, current_user)
    if creator.save
      @travel = creator.travel
      redirect_to travel_path(@travel)
    else
      creator.errors.full_messages
        render :new
    end
  end

  def edit
  end

  def update
    @travel.update(travel_params)
    redirect_to travel_path(@travel)
  end

  def destroy
    @travel.destroy
    # redirect_to , notice: 'Classroom was successfully destroyed.'
  end


  private

  def set_travel
    @travel = current_user.travels.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:name, :travel_start_date, :travel_end_date)
  end

end
