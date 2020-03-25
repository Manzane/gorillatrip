class TravelUpdater
  def initialize(set_travel, params, user)
    @travel = set_travel
    @params = params
    @user = user
  end
  attr_reader :travel
  attr_reader :travel_country
  def save
    # @travel = Travel.find(@params[:id])
    @travel.update(name: @params[:name], travel_start_date: @params[:travel_start_date], travel_end_date: @params[:travel_end_date])
    # fonctionne juste avec un seul pays [0][:id] ci dessous...
    @travel_country = TravelCountry.find(@params[:travel_countries_attributes]["0"][:id].to_i)
    @travel_country.update1(duration: @params[:travel_countries_attributes]["0"][:duration].to_i, country_id: @params[:countries_attributes]["0"][:id].to_i)
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
