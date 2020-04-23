require 'rails_helper'

describe Document do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to define_enum_for(:document_type) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#expiration_date' do

    context 'if doc is a passport' do
      before { allow(subject).to receive(:passport?).and_return(true) }
      it { is_expected.to validate_presence_of(:expiration_date) }
    end

    context 'is doc is not a passport' do
      before { allow(subject).to receive(:passport?).and_return(false) }
      it { is_expected.not_to validate_presence_of(:expiration_date) }
    end

  end

end
