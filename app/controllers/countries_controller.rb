class CountriesController < ApplicationController
  def index
    @continents = Continent.all
  end
end
