class Country < ApplicationRecord
  has_many :travel_countries
  has_many :travels, through: :travel_countries
  has_and_belongs_to_many :vaccines
end
