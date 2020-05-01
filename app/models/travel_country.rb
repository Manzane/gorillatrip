class TravelCountry < ApplicationRecord
  belongs_to :travel
  belongs_to :country
  has_many :visa_progressions, dependent: :destroy
  has_many :stay_vaccine_progressions, dependent: :destroy
  has_many :vaccine_progressions, through: :stay_vaccine_progressions

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :overlap?

  scope :exclude_self, -> id { where.not(id: id) }


  def def_duration
    duration = (end_date - start_date).to_i
  end


  def overlap?
    sql = ":end_date > start_date and end_date > :start_date"
    overlaps = travel.travel_countries.where(sql, start_date: start_date, end_date: end_date).exclude_self(id)
    is_overlapping = overlaps.exists?
    # binding.pry
    # errors.add(:overlap, "Overlap") if is_overlapping
    # p "Overlap" if is_overlapping
  end

end
