class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :proccess_user_level, :generate_user_url

  has_one :address, dependent: :destroy
  has_one :bank_account_information, dependent: :destroy
  has_one :credit_information, dependent: :destroy
  has_one :url_minifier, dependent: :destroy
  has_many :products

  mount_uploader :avatar, AvatarUploader

  serialize :invited_ids, Array

  # validates_presence_of :name
  # validates_presence_of :role
  # validates_presence_of :graduation
  # validates_presence_of :level

  validates :role, acceptance: { accept: ["seller", "consultant", "admin", "client", "franchise"] }
  validates :graduation, acceptance: { accept: ["bronze", "prata", "ouro", "diamante", "imperial", "sênior"] }

  validates_uniqueness_of :invitation_token
  validates_uniqueness_of :social_security_number, only: :update, :unless => lambda { self.tax_number.present? }
  validates_uniqueness_of :tax_number, only: :update, :unless => lambda { self.social_security_number.present? }

  # validate :social_id
  # validate :user_role
  # validate :address_presence
  # validate :bank_account_information_presence
  # validate :credit_information_presence

  accepts_nested_attributes_for :address, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :bank_account_information, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :credit_information, allow_destroy: :false, reject_if: :all_blank

  def social_id(user)
    return false if not user.social_security_number.present? and not user.tax_number.present?
  end

  def user_role(user)
    return false if user.id != 1 unless user.role != "admin"
  end

  def address_presence(user)
    return false if not user.address.present?
  end

  def bank_account_information_presence(user)
    return false if not user.bank_account_information.present?
  end

  def credit_information_presence(user)
    return false if not user.credit_information.present?
  end

  private

  def proccess_user_level
    require 'securerandom'

    if self.invited_by_token.present?
      user = User.find_by(invitation_token: self.invited_by_token)
      user.invited_ids += [self.id]

      self.invited_by_id = user.id
      self.invitation_token = nil

      until self.valid?
        self.invitation_token = SecureRandom.urlsafe_base64(5)
      end

      user.save
    else
      self.role = "seller"

      until self.valid?
        self.invitation_token = SecureRandom.urlsafe_base64(5)
      end
    end

    self.save
  end

  def generate_user_url
    url = UrlMinifier.new(user_id: self.id, code: self.invitation_token)

    until url.valid?
      url.number = rand(100000..999999)
    end
    url.save
  end
end
