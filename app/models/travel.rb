class Travel < ApplicationRecord
  include TravelOnboarding
  belongs_to :user
  has_many :travel_countries, -> { order "start_date ASC" }, dependent: :destroy
  has_many :countries, through: :travel_countries
  has_many :visa_progressions, through: :travel_countries
  has_many :stay_vaccine_progressions, through: :travel_countries
  has_many :vaccine_progressions, -> { order "vaccine_id ASC" }, dependent: :destroy

  accepts_nested_attributes_for :travel_countries
  accepts_nested_attributes_for :countries

  validates :name, presence: true
  # validates :travel_start_date, presence: true
  # validates :travel_end_date, presence: true

  def def_duration
    duration = (travel_end_date - travel_start_date).to_i
  end
end
