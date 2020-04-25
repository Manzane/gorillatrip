FactoryBot.define do

  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    username {"test"}
    date_of_birth {21.years.ago}
    gender {0}
    confirmed_at {Date.yesterday}
  end

  factory :document do
    id {1}
    name {"CR"}
    doc_type {0}
    association :user
    expiration_date {"Date.today"}
  end

  factory :continent do
    id {1}
    name {"Atlantica"}
    fr_name {"Atlantica"}
  end

  factory :country do
    id {1}
    name {"Zion"}
    french_name {"Zion"}
    association :continent
  end

  factory :travel do
    id {1}
    name {"Travel au centre de la terre"}
    association :user
  end

  factory :travel_country do
    id {1}
    association :travel
    association :country
    start_date {Date.yesterday}
    end_date {Date.tomorrow}
  end

  factory :visa do
    id {1}
    association :country
  end

  factory :visa_progression do
    id {1}
    association :visa
    association :travel_country
    done {false}
  end

  factory :vaccine do
    id {1}
    name {"HA"}
  end

  factory :vaccine_country do
    id {1}
    association :vaccine
    association :country
    systematic {false}
  end

  factory :vaccine_progression do
    id {1}
    association :vaccine
    association :travel
    done {false}
  end

  factory :stay_vaccine_progression do
    id {1}
    association :vaccine_progression
    association :travel_country
  end

end
