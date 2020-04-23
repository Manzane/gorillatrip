require 'rails_helper'

describe Vaccine do
  it { is_expected.to have_many(:vaccine_countries) }
  it { is_expected.to have_many(:countries) }
  it { is_expected.to have_many(:vaccine_progressions) }
  it { is_expected.to validate_presence_of(:name) }
end
