require 'rails_helper'

describe Country do
  it { is_expected.to belong_to(:continent).optional }
  it { is_expected.to have_many(:travels) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to have_many(:visas) }
  it { is_expected.to have_many(:vaccines) }
  it { is_expected.to have_many(:vaccine_countries) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:french_name) }
end
