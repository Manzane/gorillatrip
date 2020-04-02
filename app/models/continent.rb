class Continent < ApplicationRecord
  has_many :countries, dependent: :destroy
  has_many :travel_countries, through: :countries
end
