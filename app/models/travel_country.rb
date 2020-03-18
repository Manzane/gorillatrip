class TravelCountry < ApplicationRecord
  belongs_to :travel
  belongs_to :country
end
