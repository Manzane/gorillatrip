require 'rails_helper'

describe VaccineProgression do
  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:vaccine) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:travel_countries) }
  # it { is_expected.to validate_uniqueness_of(:vaccine).scoped_to(:travel) }
end
