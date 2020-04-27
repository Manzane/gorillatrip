require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to have_many(:travels) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to have_many(:documents) }
  it { is_expected.to define_enum_for(:gender) }

  # it 'has a valid Factory' do
  #   expect(build(:user)).to be_valid
  # end
   describe '#def_age' do
    it 'calculate age' do
      user2 = create(:user, date_of_birth: 20.years.ago)
      age = ((Time.zone.now - user2.date_of_birth.to_time) / 1.year.seconds).floor

      expect(age).to eq(20)
    end
  end

end
