require 'rails_helper'

describe StayVaccineProgression do
  it { is_expected.to belong_to(:vaccine_progression) }
  it { is_expected.to belong_to(:travel_country) }
end
