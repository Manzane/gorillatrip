require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to have_many(:travels) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to have_many(:documents) }
  it { is_expected.to define_enum_for(:gender) }

   describe '#def_age' do
    it 'calculate age' do
      user2 = create(:user, date_of_birth: 20.years.ago)
      expect(user2.def_age).to eq(20)
    end
  end

end
