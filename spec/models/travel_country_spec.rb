require 'rails_helper'

describe TravelCountry do
  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:country) }
  it { is_expected.to have_many(:visa_progressions) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:vaccine_progressions) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  # before { FactoryBot.create(:travel, id: 1)}
  # subject { FactoryBot.create(:travel_country, travel_id: 1, start_date: Date.today, end_date: Date.tomorrow) }

  before { @travel = FactoryBot.create(:travel) }
  subject { FactoryBot.create(:travel_country, travel: @travel, start_date: Date.today, end_date: Date.tomorrow) }


  describe '#def_duration' do
      it {expect(subject.def_duration).to eq(1)}
  end

  describe '#overlap?' do
    context 'when dates don\'t overlap' do
      before { FactoryBot.create(:travel_country, travel: @travel, start_date: Date.yesterday, end_date: Date.today) }
      it {expect(subject.overlap?).to eq(false)}
    end
    context 'when dates overlap' do
      before { FactoryBot.create(:travel_country, travel: @travel, start_date: Date.yesterday, end_date: Date.tomorrow) }
      it {expect(subject.overlap?).to eq(true)}
    end
  end
end
