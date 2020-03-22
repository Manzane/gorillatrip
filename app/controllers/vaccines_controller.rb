class VaccinesController < ApplicationController
  before_action :set_vaccine, only: :show

  def index
    @vaccines = Vaccine.all
  end

  def show
  end

  private

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

end
