require 'rails_helper'

describe VaccineProgression do

  it { is_expected.to belong_to(:travel) }
  it { is_expected.to belong_to(:vaccine) }
  it { is_expected.to have_many(:stay_vaccine_progressions) }
  it { is_expected.to have_many(:travel_countries) }

  describe 'uniqueness of travel and vaccine' do

    subject { VaccineProgression.new(vaccine_id: 1, travel_id: 1) }

    context 'when vaccineprogression is not unique' do
      before { VaccineProgression.create(vaccine_id: 1, travel_id: 1) }
      it {expect(subject).to be_invalid}
    end

    # it { is_expected.to validate_uniqueness_of(:vaccine_id).scoped_to(:travel_id)}
  end

end
