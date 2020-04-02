class Country < ApplicationRecord
  belongs_to :continent, optional: true
  has_many :travel_countries
  has_many :travels, through: :travel_countries
  has_many :visas
  has_and_belongs_to_many :vaccines

end
