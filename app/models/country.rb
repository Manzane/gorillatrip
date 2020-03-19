class Country < ApplicationRecord
  has_many :travel_countries
  has_many :travels, through: :travel_countries
  has_many :visas
  has_and_belongs_to_many :vaccines

  # def create_countries
  #   CountriesService.new.call
  # end
end
