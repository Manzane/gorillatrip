FactoryBot.define do

  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    username {"test"}
    date_of_birth {21.years.ago}
    gender {0}
    confirmed_at {Date.today}
    # # Add additional fields as required via your User model
  end

end
