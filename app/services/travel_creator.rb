class TravelCreator
  def initialize(params, user)
    @params = params
    @user = user
  end
  attr_reader :travel
  def save
    @travel = Travel.create(name: @params[:name], user: @user )
    TravelCountry.create(start_date: @params[:travel_countries_attributes]["0"][:start_date], end_date: @params[:travel_countries_attributes]["0"][:end_date], travel: @travel, country_id: @params[:travel_countries_attributes]["0"][:country_id].to_i)
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
