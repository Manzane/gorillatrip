require 'rails_helper'

describe Continent do
  it { is_expected.to have_many(:countries) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:fr_name) }
end
