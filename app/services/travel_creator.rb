class TravelCreator
  def initialize(params, user)
    @params = params
    @user = current_user
  end
  attr_reader :travel
  def save
    @travel = Travel.create(name: @params[:travel][:name], travel_start_date: @params[:travel][:travel_start_date], travel_end_date: @params[:travel][:travel_end_date])
    TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # @params[:travel][:country].each do |c|
    #   TravelCountry.create(duration: @params[:travel][:duration], travel: @travel, country: @params[:travel][:country])
    # end
    true
  end
end
