class VisaProgressionsController < ApplicationController
  before_action :set_travel_country, only: [:create, :update]
  before_action :set_visa, only: [:create]
  before_action :set_visa_progression, only: [:update]

  def create
    @visa_progression = VisaProgression.new(done: false, visa: @visa, travel_country: @travel_country)
    if @visa_progression.save
      redirect_to travel_path(Travel.find(@travel_country.travel_id)), notice: t('.choose')
    else
      @visa_progression.errors.full_messages
    end
  end

  def update
    if ! @visa_progression.done
      @visa_progression.update(done: true)
      if @visa_progression.save
        redirect_to travel_path(Travel.find(@travel_country.travel_id)), notice: t('.done')
      else
        @visa_progression.errors.full_messages
      end
    else
     @visa_progression.update(done: false)
      if @visa_progression.save
        redirect_to travel_path(Travel.find(@travel_country.travel_id)), notice: t('.undone')
      else
        @visa_progression.errors.full_messages
      end
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
