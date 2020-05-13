class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  has_one :bank_account_information, dependent: :destroy
  has_one :credit_information, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  # validates_presence_of :name
  # validates_presence_of :role
  # validates_presence_of :graduation
  # validates_presence_of :level

  validates :role, acceptance: { accept: ["seller", "consultant", "admin", "client", "franchise"] }
  validates :graduation, acceptance: { accept: ["sênior", "bronze", "prata", "ouro", "diamante", "imperial"] }

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
end
