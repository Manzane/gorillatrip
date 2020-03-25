class TravelCreator
  def initialize(params, user)
    @params = params
    @user = user
  end
  attr_reader :travel
  def save
    @travel = Travel.create(name: @params[:name], travel_start_date: @params[:travel_start_date], travel_end_date: @params[:travel_end_date], user: @user )
    TravelCountry.create(duration: @params[:travel_countries_attributes]["0"][:duration].to_i, travel: @travel, country_id: @params[:countries_attributes]["0"][:id].to_i)
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
