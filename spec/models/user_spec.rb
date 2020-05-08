require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to have_many(:travels) }
  it { is_expected.to have_many(:travel_countries) }
  it { is_expected.to have_many(:documents) }
  it { is_expected.to define_enum_for(:gender) }

   describe '#def_age' do
      subject { FactoryBot.create(:user, date_of_birth: 20.years.ago) }

      it {expect(subject.def_age).to eq(20)}
  end

end
