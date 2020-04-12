class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_countries, dependent: :destroy
  has_many :countries, through: :travel_countries
  has_many :visa_progressions, through: :travel_countries
  has_many :stay_vaccine_progressions, through: :travel_countries
  has_many :vaccine_progressions, dependent: :destroy

  accepts_nested_attributes_for :travel_countries
  accepts_nested_attributes_for :countries

  # validates :travel_start_date, presence: true
  # validates :travel_end_date, presence: true
end
