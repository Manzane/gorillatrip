require 'rails_helper'

describe Travel do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:countries) }
  it { is_expected.to have_many(:travel_countries).order('start_date ASC') }
  it { is_expected.to have_many(:visa_progressions) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:vaccine_progressions).order('vaccine_id ASC') }
  it { is_expected.to accept_nested_attributes_for(:travel_countries) }
  it { is_expected.to accept_nested_attributes_for(:countries) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#def_duration' do
      subject { FactoryBot.create(:travel, travel_start_date: Date.yesterday, travel_end_date: Date.tomorrow) }

      it {expect(subject.def_duration).to eq(2)}
  end
end
