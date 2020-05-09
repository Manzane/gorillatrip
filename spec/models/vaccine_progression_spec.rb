require 'rails_helper'

describe VaccineProgression do

  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:vaccine) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:travel_countries) }

  describe 'uniqueness of travel and vaccine' do

    before { @vaccine1 = FactoryBot.create(:vaccine) }
    before { @vaccine2 = FactoryBot.create(:vaccine) }
    before { @travel = FactoryBot.create(:travel) }

    subject { FactoryBot.build(:vaccine_progression, vaccine: @vaccine1, travel: @travel) }

    context 'when vaccineprogression is unique' do
      before { FactoryBot.create(:vaccine_progression, vaccine: @vaccine2, travel: @travel) }
      it {expect(subject).to be_valid}
    end

    context 'when vaccineprogression is not unique' do
      before { FactoryBot.create(:vaccine_progression, vaccine: @vaccine1, travel: @travel) }
      it {expect(subject).to be_invalid}
    end



    # it { is_expected.to validate_uniqueness_of(:vaccine_id).scoped_to(:travel_id)}
  end

end
