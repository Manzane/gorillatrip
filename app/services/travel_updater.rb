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
    @travel.update(name: @params[:name])
    # fonctionne juste avec un seul pays [0][:id] ci dessous...
    # stays = @params[:travel_countries_attributes].keys
    # nb_s = stays.size
    # for stay in stays

    @params[:travel_countries_attributes].each {|key, value|
    @travel_country = TravelCountry.find(@params[:travel_countries_attributes]["#{key}"][:id].to_i)
    @travel_country.update(start_date: @params[:travel_countries_attributes]["#{key}"][:start_date], end_date: @params[:travel_countries_attributes]["#{key}"][:end_date], country_id: @params[:travel_countries_attributes]["#{key}"][:country_id].to_i)

  }

    # @travel_country = TravelCountry.find1(@params[:travel_countries_attributes]["0"][:id].to_i)
    # @travel_country.update(start_date: @params[:travel_countries_attributes]["0"][:start_date], end_date: @params[:travel_countries_attributes]["0"][:end_date], country_id: @params[:travel_countries_attributes]["0"][:country_id].to_i)



    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
