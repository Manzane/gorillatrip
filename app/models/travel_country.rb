class TravelCountry < ApplicationRecord
  belongs_to :travel
  belongs_to :country
  has_many :visa_progressions, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
