class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :travels, dependent: :destroy
  has_many :travel_countries, through: :travels
  has_many :documents, dependent: :destroy
  has_one_attached :avatar
  validates :username, presence: true, uniqueness: true
  enum gender: {male: 0, female: 1, other: 2}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  def self.from_omniauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, email: auth.info.email).first
    unless user
      user ||= User.create!(provider: auth.provider, uid: auth.uid, image: auth.info.image, username: auth.info.name, email: auth.info.email, password: Devise.friendly_token[0,20])
    end
    user
  end

  def def_age
    age = ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  end

  def self.i18n_genders(hash = {})
    genders.keys.each { |key| hash[I18n.t("user_genders.#{key}")] = key }
    hash
  end
end
