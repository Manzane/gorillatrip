class VaccineProgression < ApplicationRecord
  belongs_to :vaccine
  has_many :stay_vaccine_progressions
  has_many :travel_countries, through: :stay_vaccine_progressions

end
