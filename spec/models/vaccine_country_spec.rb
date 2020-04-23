require 'rails_helper'

describe VaccineCountry do
  it { is_expected.to belong_to(:vaccine) }
  it { is_expected.to belong_to(:country) }
end
