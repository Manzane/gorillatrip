class Document < ApplicationRecord
  belongs_to :user
  has_many_attached :files
  validates :name, presence: true
  # validates :doc_type, inclusion: { in: ["passport", "airplane ticket", "visa"] }
  enum document_type: { passport: 0, airplane_ticket: 1, visa: 2, other: 3 }
  validates :expiration_date, presence: true, if: :passport?

  def passport?
    document_type == "passport"
  end

  def self.i18n_document_types(hash = {})
    document_types.keys.each { |key| hash[I18n.t("document_document_types.#{key}")] = key }
    hash
  end
end
