class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_countries, dependent: :destroy
  has_many :countries, through: :travel_countries

  accepts_nested_attributes_for :travel_countries

  validates :travel_start_date, presence: true
  validates :travel_end_date, presence: true
end
