class VisaProgressionsController < ApplicationController
  before_action :set_travel_country, only: [:create, :update, :destroy]
  before_action :set_visa, only: [:create, :update, :destroy]
  before_action :set_visa_progression, only: [:update, :destroy]

  def index
  end

  def show
  end

  def create
    @visa_progression = VisaProgression.new(done: false, visa: @visa, travel_country: @travel_country)
    if @visa_progression.save
      redirect_to travel_path(Travel.find(@travel_country.travel_id)), notice: 'Le visa a bien été ajouté à la to-do liste.'
    else
      @visa_progression.errors.full_messages
    end
  end

  def update
    @visa_progression.update(done: true)
    if @visa_progression.save
      redirect_to travel_path(Travel.find(@travel_country.travel_id)), notice: 'Le visa a bien été ajouté à la to-do liste.'
    else
      @visa_progression.errors.full_messages
    end
  end

  private
  def set_travel_country
    @travel_country = current_user.travel_countries.find(params[:travels_country_id])
  end

  def set_visa
    @visa = Visa.find(params[:visa_id])
  end

  def set_visa_progression
    @visa_progression = VisaProgression.find(params[:id])
  end


end
