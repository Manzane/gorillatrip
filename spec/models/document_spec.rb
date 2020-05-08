require 'rails_helper'

describe Document do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to define_enum_for(:document_type) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#passport?' do

    subject { FactoryBot.build(:document) }

    context 'expiration_date mandatory if so' do
      before { allow(subject).to receive(:passport?).and_return(true) }
      it { is_expected.to validate_presence_of(:expiration_date) }
    end

    context 'expiration_date not mandatory if not' do
      before { allow(subject).to receive(:passport?).and_return(false) }
      it { is_expected.not_to validate_presence_of(:expiration_date) }
    end

  end

end
