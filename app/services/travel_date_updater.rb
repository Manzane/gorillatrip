class TravelDateUpdater

  def initialize(travel)
    @travel = travel
  end

  def save
    travel_countries = TravelCountry.where("travel_id = #{@travel.id}")
    first_stay = travel_countries.order('start_date ASC').first
    @first_date = first_stay.start_date
    last_stay = travel_countries.order('end_date DESC').first
    @last_date = last_stay.end_date
    # binding.pry
    @travel.update!(travel_start_date: @first_date, travel_end_date: @last_date)

    true
  end
end
