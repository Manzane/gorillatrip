class VaccineProgressionConstructor
  def initialize(travel_country)
    @travel_country = travel_country
  end

  # attr_reader :travel

  def save
    country = Country.find(@travel_country.country_id)
    vaccines = country.vaccines
    # binding.pry
    # condition where
    s = country.vaccines.where('"systematic" = true')
    # VaccineCountry.all.where('"systematic" = true')
    country.vaccines.where('"systematic" = true').each do |vaccine|
      vp = VaccineProgression.create(vaccine_id: vaccine.id, done: false)
      vp.save!
      svp = StayVaccineProgression.create!(travel_country_id: @travel_country.id, vaccine_progression_id: vp.id)
      svp.save!
    end
    # binding.pry
    true
  end
end
