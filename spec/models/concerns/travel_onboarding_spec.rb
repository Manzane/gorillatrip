require 'rails_helper'

describe TravelOnboarding do

  # before { create(:user, id: 2) }
  # after { create(:vaccine, id: 2) }
  # after { create(:continent, id: 2) }
  # after { create(:country, id: 2, continent_id: 2) }
  # after { create(:visa, id: 2, country_id: 2) }

  before { @travel = FactoryBot.create(:travel) }
  before { @tc1 = FactoryBot.create(:travel_country, travel: @travel)}
  # before { @vaccine = FactoryBot.create(:vaccine)}
  before { @vaccinep1 = FactoryBot.create(:vaccine_progression, travel: @travel, done: false)}
  before { @visap1 = FactoryBot.create(:visa_progression, travel_country: @tc1, done: false)}


  # before { vaccine2 = create(:vaccine, id: 2) }

  describe '#onboarding_percent' do
    context 'when only vaccine_progressions empty' do
      # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(subject.overlap?).to eq(false)}
    end

    context 'when only visa_progressions empty' do
      # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(subject.overlap?).to eq(false)}
    end

    context 'when both are empty' do
      # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(subject.overlap?).to eq(false)}
    end

    context 'when none is empty' do
      # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(subject.overlap?).to eq(false)}
    end
  end

  describe '#onboarding_vaccine_percent' do
    context 'when no vaccine done' do
      # before { create(:vaccine_progression, travel_id: :travel, vaccine_id: :vaccine) }
      # # before { travel = create(:travel, id: 2) }
      it { expect(@travel.onboarding_vaccine_percent).to eq(0) }
    end

    context 'when the only vaccine done' do
      # @vaccinep1.update(done: true)
      # # before { vp2.done = true }
      # vp1 = subject.vaccine_progressions.first
      # vp1.done = true
      # vp2 = subject.vaccine_progressions.last
      # vp2.done = true
      # # before { allow(subject).to receive(:vaccine_progression).with(done: true) }
      # # before { create(:vaccine_progression, vaccine_id: 2, travel_id: 2, done: true)}
      # it { expect(@travel.onboarding_vaccine_percent).to eq(100) }
    end

    context 'when 1/2 vaccine done' do
      # vp1 = subject.vaccine_progressions.first
      # vp1.done = true
      # # before { vp2 = create(:vaccine_progression, id: 2, travel_id: 2, vaccine_id: 2, done: false) }
      # it { expect(subject.onboarding_vaccine_percent).to eq(50) }
    end
  end

  describe '#onboarding_visa_percent' do

    context 'when no visa done' do
      # # before { travel = create(:travel, id: 2) }
      it { expect(@travel.onboarding_visa_percent).to eq(0) }
    end
    context 'when the only visa done' do
      # @visap1.update(done: true)
      # before { create(:travel_country, id: 4, travel_id: 2, country_id: 2, start_date: Date.yesterday, end_date: Date.tomorrow) }
      # before { create(:visa_progression, id: 2, travel_country_id: 4, visa_id: 2, done: true) }
      # # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(@travel.onboarding_visa_percent).to eq(100)}
    end
    context 'when 1/2 visa done' do
      # # before { create(:travel_country, travel_id: 2, id: 3, start_date: Date.yesterday, end_date: Date.today) }
      # it {expect(subject.onboarding_visa_percent).to eq(50)}
    end
  end

end
