class VaccineProgressionTConstructor
  def initialize(travel_country, travel)
    @travel_country = travel_country
    @travel = travel
  end

  def save
    travel_country = @travel_country.first
    country = Country.find(travel_country.country_id)
    vaccines = country.vaccines
    # binding.pry
    country.vaccines.where('"systematic" = true').each do |vaccine|
      vp = VaccineProgression.where("vaccine_id = #{vaccine.id} AND travel_id = #{@travel.id}")
      if !vp.empty?
        svp = StayVaccineProgression.create!(travel_country_id: travel_country.id, vaccine_progression_id: vp.ids.first)
        svp.save
      else
        new_vp = VaccineProgression.create(vaccine_id: vaccine.id, done: false, travel_id: @travel.id)
        if new_vp.save
          svp = StayVaccineProgression.create!(travel_country_id: travel_country.id, vaccine_progression_id: new_vp.id)
          svp.save!
        end
      end
    end
    # binding.pry
    true
  end
end
