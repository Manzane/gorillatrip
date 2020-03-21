class TravelCreator
  def initialize(params, user)
    @params = params
    @user = user
  end
  attr_reader :travel
  def save
    @travel = Travel.create(name: @params[:travel][:name], travel_start_date: @params[:travel][:travel_start_date], travel_end_date: @params[:travel][:travel_end_date], user: @user )
    TravelCountry.create(duration: @params[:travel][:travel_countries], travel: @travel, country_id: @params[:travel][:country_ids].to_i)
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
