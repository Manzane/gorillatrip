module TravelOnboarding
  extend ActiveSupport::Concern



  def onboarding_percent
    # return 100 if onboarding_completed_at?

    steps = [:vaccine_progress?, :visa_progress?]
    complete = steps.select{ |step| send(step) }
    percent = complete.length / steps.length.to_f * 100
    update(onboarding_completed_at: Time.current) if percent == 100
    percent
  end

  def vaccine_progress?
    # false
    nb_vaccine = vaccine_progressions.count
    nb_vaccine_done = vaccine_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    nb_vaccine == nb_vaccine_done
    # vaccine_progressions.any?

  end

  def visa_progress?
    # true
    nb_visa = visa_progressions.count
    nb_visa_done = visa_progressions.where('"done" = true').count
    nb_tc = travel_countries.count
    nb_visa == nb_visa_done
    # travel_countries.any?
  end
end
