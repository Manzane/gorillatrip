class Vaccine < ApplicationRecord
  has_many :vaccine_countries
  has_many :countries, through: :vaccine_countries
end
