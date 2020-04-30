require 'rails_helper'

describe TravelCountry do
  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:country) }
  it { is_expected.to have_many(:visa_progressions) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:vaccine_progressions) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  describe '#def_duration' do
    it 'calculate travel_country duration' do
      tc = create(:travel_country, start_date: Date.yesterday, end_date:Date.tomorrow )
      expect(tc.def_duration).to eq(2)
    end
  end
end
