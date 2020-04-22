require 'rails_helper'

describe Travel do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:countries) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to have_many(:visa_progressions) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:vaccine_progressions) }
  it { is_expected.to accept_nested_attributes_for(:travel_countries) }
  it { is_expected.to accept_nested_attributes_for(:countries) }
  it { is_expected.to validate_presence_of(:name) }

end
