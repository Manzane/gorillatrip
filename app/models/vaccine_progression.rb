class VaccineProgression < ApplicationRecord
  belongs_to :vaccine
  belongs_to :travel
  has_many :stay_vaccine_progressions
  has_many :travel_countries, through: :stay_vaccine_progressions

  validates :vaccine, uniqueness: { scope: :travel }

end
