require 'rails_helper'

describe Visa do
  it { is_expected.to belong_to(:country) }
  it { is_expected.to have_many(:visa_progressions) }
end
