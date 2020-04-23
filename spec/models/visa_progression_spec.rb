require 'rails_helper'

describe VisaProgression do
  it { is_expected.to belong_to(:visa) }
  it { is_expected.to belong_to(:travel_country) }
end
