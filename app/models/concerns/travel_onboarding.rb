module TravelOnboarding
  extend ActiveSupport::Concern

  def onboarding_percent
    return 0 if visa_progressions.empty?

    nb_vaccine = vaccine_progressions.count
    nb_vaccine_done = vaccine_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    @percent_vaccine_done = nb_vaccine_done / nb_vaccine.to_f

    nb_visa = visa_progressions.count
    nb_visa_done = visa_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    @percent_visa_chosen = nb_visa / nb_tc.to_f
    @percent_visa_done = nb_visa_done / nb_visa.to_f
    @percent_visa = nb_visa_done / nb_tc.to_f

    steps = [@percent_vaccine_done, @percent_visa]
    global = @percent_vaccine_done + @percent_visa
    percent_global = global / steps.length.to_f * 100
    percent_global
  end


 def onboarding_vaccine_percent
    nb_vaccine = vaccine_progressions.count
    nb_vaccine_done = vaccine_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    @percent_vaccine_done = nb_vaccine_done / nb_vaccine.to_f * 100
    @percent_vaccine_done
  end


   def onboarding_visa_percent
    nb_visa = visa_progressions.count
    nb_visa_done = visa_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    @percent_visa_chosen = nb_visa / nb_tc.to_f * 100
    @percent_visa_done = nb_visa_done / nb_visa.to_f * 100
    @percent_visa = nb_visa_done / nb_tc.to_f * 100
    @percent_visa
  end

end
