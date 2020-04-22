require 'rails_helper'

describe User do
  it 'validates presence of username' do
    user = User.new(email: 'test@test.com')

    expect(user.valid?).to eq(false)
    expect(user.errors[:username].present?).to eq(true)
  end

end
