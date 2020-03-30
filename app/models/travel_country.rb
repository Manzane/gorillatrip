class TravelCountry < ApplicationRecord
  belongs_to :travel
  belongs_to :country

  validates :start_date, presence: true
  validates :end_date, presence: true
end
