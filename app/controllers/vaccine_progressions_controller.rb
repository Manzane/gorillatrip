class VaccineProgressionsController < ApplicationController
  before_action :set_travel
  before_action :set_vaccine_progression

  def update
    if ! @vaccine_progression.done
      @vaccine_progression.update(done: true)
      if @vaccine_progression.save
        redirect_to travel_path(@travel), notice: t('.done')
      else
        @vaccine_progression.errors.full_messages
      end
    else
     @vaccine_progression.update(done: false)
      if @vaccine_progression.save
        redirect_to travel_path(@travel), notice: t('.undone')
      else
        @vaccine_progression.errors.full_messages
      end
    end
  end

    private
  def set_travel
    @travel = current_user.travels.find(params[:travel_id])
  end

  def set_vaccine_progression
    @vaccine_progression = VaccineProgression.find(params[:id])
  end

end
