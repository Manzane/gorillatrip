require 'rails_helper'

describe TravelOnboarding do

  before { @travel = FactoryBot.create(:travel) }
  before { @tc1 = FactoryBot.create(:travel_country, travel: @travel)}


  describe '#onboarding_percent' do
    context 'when only vaccine_progressions empty' do
      before { FactoryBot.create(:visa_progression, :done, travel_country: @tc1)}

    it { expect(@travel.onboarding_percent).to eq(50) }
    end

    context 'when only visa_progressions empty' do
      before { FactoryBot.create(:vaccine_progression, :done, travel: @travel)}

      it { expect(@travel.onboarding_percent).to eq(50) }
    end

    context 'when both are empty' do

      it { expect(@travel.onboarding_percent).to eq(0) }
    end

    context 'when none is empty' do
      before { FactoryBot.create(:vaccine_progression, :done, travel: @travel)}
      before { FactoryBot.create(:visa_progression, :done, travel_country: @tc1)}

      it { expect(@travel.onboarding_percent).to eq(100) }
    end
  end

  describe '#onboarding_vaccine_percent' do
    context 'when no vaccine systematic' do

      it { expect(@travel.onboarding_vaccine_percent).to eq(0) }
    end

    context 'when no vaccine done' do
      before { FactoryBot.create(:vaccine_progression, travel: @travel)}

      it { expect(@travel.onboarding_vaccine_percent).to eq(0) }
    end

    context 'when the only vaccine done' do
      before { FactoryBot.create(:vaccine_progression, :done, travel: @travel)}

      it { expect(@travel.onboarding_vaccine_percent).to eq(100) }
    end

    context 'when 1/2 vaccine done' do
      before { FactoryBot.create(:vaccine_progression, :done, travel: @travel)}
      before { FactoryBot.create(:vaccine_progression, travel: @travel)}

      it { expect(@travel.onboarding_vaccine_percent).to eq(50) }
    end
  end

  describe '#onboarding_visa_percent' do
    context 'when no visa picked' do

      it { expect(@travel.onboarding_visa_percent).to eq(0) }
    end

    context 'when no visa done' do
      before { FactoryBot.create(:visa_progression, travel_country: @tc1)}

      it { expect(@travel.onboarding_visa_percent).to eq(0) }
    end

    context 'when the only visa done' do
      before { FactoryBot.create(:visa_progression, :done, travel_country: @tc1)}

      it {expect(@travel.onboarding_visa_percent).to eq(100)}
    end

    context 'when 1/2 visa done' do
      before { @tc2 = FactoryBot.create(:travel_country, travel: @travel)}
      before { FactoryBot.create(:visa_progression, :done, travel_country: @tc1)}
      before { FactoryBot.create(:visa_progression, travel_country: @tc2)}

      it {expect(@travel.onboarding_visa_percent).to eq(50)}
    end
  end

end
