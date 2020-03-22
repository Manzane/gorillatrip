class TravelUpdater
  def initialize(params, user)
    @params = params
    @user = user
  end
  attr_reader :travel
  attr_reader :travel_country
  def save
    @travel = Travel.find(@params[:id])
    @travel.update(name: @params[:travel][:name], travel_start_date: @params[:travel][:travel_start_date], travel_end_date: @params[:travel][:travel_end_date])
    # fonctionne juste avec un seul pays [0][:id] ci dessous...
    @travel_country = TravelCountry.find(@travel.travel_countries[0][:id])
    @travel_country.update(duration: @params[:travel][:travel_countries_attributes]["0"][:duration], country_id: @params[:travel][:country_ids].to_i)
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
