class Travel < ApplicationRecord
  belongs_to :user
  has_many :travel_countries
  has_many :countries, through: :travel_countries
end
