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

  # describe '#def_age' do

  #   context 'if doc is a passport' do
  #     before { allow(subject).to receive(:passport?).and_return(true) }
  #     it { is_expected.to validate_presence_of(:expiration_date) }
  #   end

  # end

end
