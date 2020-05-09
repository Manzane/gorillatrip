FactoryBot.define do

  factory :user do
    # id {1}
    email {"test@user.com"}
    password {"qwerty"}
    username {"test"}
    date_of_birth {21.years.ago}
    gender {0}
    nationality {"fr"}
    phone_number {"0302010203"}
    age {}
    confirmed_at {Date.yesterday}

  end

  factory :document do
    # id {1}
    name {"CR"}
    document_type {"passport"}
    association :user
    expiration_date {Date.today}
  end

  factory :continent do
    # id {1}
    name {"Atlantica"}
    fr_name {"Atlantica"}
  end

  factory :country do
    # id {1}
    name {"Zion"}
    french_name {"Zion"}
    alpha2code {"ZI"}
    alpha3code {"ZIN"}
    region {"Space"}
    flag_url {"www.flag.com"}
    association :continent
  end

  factory :travel do
    # id {1}
    name {"Travel au centre de la terre"}
    association :user
    travel_start_date {}
    travel_end_date {}
    onboarding_completed_at {}
  end

  factory :travel_country do
    # id {1}
    association :travel
    association :country
    start_date {Date.yesterday}
    end_date {Date.tomorrow}
    duration {}
  end

  factory :visa do
    # id {1}
    association :country
    name {"Visa"}
    extra_info {"extra_info"}
    deliverance_max_date {Date.yesterday}
    duration {"duration"}
    price {"price"}
    embassy {"www.embassy"}
    application {"www.application"}
    age_max {30}
    duration_int {60}
    validity {"validity"}
    fr_diplomacy {"www.fr_diplomacy"}
  end

  factory :visa_progression do
    # id {1}
    association :visa
    association :travel_country
    done {false}

    trait :done do
      done {true}
    end
  end

  factory :vaccine do
    # id {1}
    name {"HA"}
    contraindications {"contraindications"}
    price {10}
    disease_description {"disease_description"}
    risks {"risks"}
    treatment_type {"treatment_type"}
    treatment {"treatment"}
    vaccine_schema {"vaccine_schema"}
    treatment_start {Date.yesterday}
    treatment_end {Date.tomorrow}
    injection_max {Date.yesterday}
    travel_advised {false}
  end

  factory :vaccine_country do
    # id {1}
    association :vaccine
    association :country
    systematic {false}
    extra_info {}
  end

  factory :vaccine_progression do

    # id {1}
    association :vaccine
    association :travel
    done {false}

    trait :done do
      done {true}
    end
  end

  factory :stay_vaccine_progression do
    # id {1}
    association :vaccine_progression
    association :travel_country
  end

end
