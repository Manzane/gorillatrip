class VisasController < ApplicationController
    before_action :set_visa, only: :show
    before_action :set_country

  def index
    @visas = Visa.all
  end

  def show
  end

  private

  def set_visa
    @visa = Visa.find(params[:id])

  end

  def set_country
    @country = Country.find(params[:country_id])
  end
end
