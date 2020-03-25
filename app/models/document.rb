class Document < ApplicationRecord
  belongs_to :user
  has_many_attached :files
  validates :name, presence: true
  validates :type, inclusion: { in: ["passport", "airplane ticket", "visa"] }

end
