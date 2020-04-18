class TravelUpdater
  def initialize(set_travel, params, user)
    @travel = set_travel
    @params = params
    @user = user
  end
  attr_reader :travel
  attr_reader :travel_country

  def save

    @travel.update!(name: @params[:name])
    # binding.pry
    @params[:travel_countries_attributes].each { |key, value|
      tc_id = @params[:travel_countries_attributes]["#{key}"][:id].to_i
      tc = TravelCountry.find(tc_id)
      tc.country_id
      @stay = tc
      @stay.update!(start_date: @params[:travel_countries_attributes]["#{key}"][:start_date], end_date: @params[:travel_countries_attributes]["#{key}"][:end_date])
    }
    true
  end
end
