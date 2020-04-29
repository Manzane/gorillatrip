require 'rails_helper'

describe VaccineProgression do

  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:vaccine) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:travel_countries) }

  describe 'uniqueness of travel and vaccine' do

    before { create(:vaccine, id: 1) }
    before { create(:vaccine, id: 2) }
    before { create(:travel, id: 1) }

    subject { build(:vaccine_progression, vaccine_id: 1, travel_id: 1) }

    context 'when vaccineprogression is unique' do
      before { create(:vaccine_progression, id: 1, vaccine_id: 2, travel_id: 1) }
      it {expect(subject).to be_valid}
    end

    context 'when vaccineprogression is not unique' do
      before { create(:vaccine_progression, id: 2, vaccine_id: 1, travel_id: 1) }
      it {expect(subject).to be_invalid}
    end



    # it { is_expected.to validate_uniqueness_of(:vaccine_id).scoped_to(:travel_id)}
  end

end
