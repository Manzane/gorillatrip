class Country < ApplicationRecord
  belongs_to :continent, optional: true
  has_many :travel_countries
  has_many :travels, through: :travel_countries
  has_many :visas
  has_many :vaccine_countries
  has_many :vaccines, through: :vaccine_countries

end
