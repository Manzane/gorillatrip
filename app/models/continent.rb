class Continent < ApplicationRecord
  has_many :countries, dependent: :destroy
  has_many :travel_countries, through: :countries

  validates :name, presence: true
  validates :fr_name, presence: true
end
