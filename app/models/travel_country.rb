class TravelCountry < ApplicationRecord
  belongs_to :travel
  belongs_to :country
  has_many :visa_progressions, dependent: :destroy
  has_many :stay_vaccine_progressions, dependent: :destroy
  has_many :vaccine_progressions, through: :stay_vaccine_progressions

  validates :start_date, presence: true
  validates :end_date, presence: true

  def def_duration
    duration = (end_date - start_date).to_i
  end
end
