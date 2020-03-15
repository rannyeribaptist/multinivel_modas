class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  has_one :bank_account_information, dependent: :destroy
  has_one :credit_information, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :graduation
  validates_presence_of :level

  validates :role, acceptance: { accept: ["seller", "consultant", "admin", "client", "franchise"] }
  validates :graduation, acceptance: { accept: ["sênior", "bronze", "prata", "ouro", "diamante", "imperial"] }

  validate :social_id
  validate :user_role
  validate :address_presence
  validate :bank_account_information_presence
  validate :credit_information_presence

  accepts_nested_attributes_for :address, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :bank_account_information, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :credit_information, allow_destroy: :false, reject_if: :all_blank

  private

  def social_id
    if not self.social_security_number.present? and not self.tax_number.present?
      errors.add(:social_security_number, "CPF não pode ficar em Branco")
      errors.add(:tax_number, "CNPJ não pode ficar em Branco")
    end
  end

  def user_role
    if self.id != 1
      errors.add(:role, "Houve um erro com seu nível de permissão. Entre em contato com o suporte para solucionar este problema.") unless self.role != "admin"
    end
  end

  def address_presence
    if not self.address.present?
      errors.add(:address, "Verifique os dados do seu endereço e tente novamente")
    end
  end

  def bank_account_information_presence
    if not self.bank_account_information.present?
      errors.add(:bank_account_information, "Verifique os seus dados bancários e tente novamente")
    end
  end

  def credit_information_presence
    if not self.credit_information.present?
      errors.add(:credit_information, "Verifique os seus dados do cartão de crédito e tente novamente")
    end
  end
end
