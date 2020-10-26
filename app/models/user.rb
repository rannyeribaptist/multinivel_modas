class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :proccess_user_level, :generate_user_url, :create_shopping_cart unless Rails.env == "test"

  has_one :address, dependent: :destroy
  has_one :bank_account_information, dependent: :destroy
  has_one :credit_information, dependent: :destroy
  has_one :url_minifier, dependent: :destroy
  has_one :shopping_cart, dependent: :destroy
  has_one :user_starter_pack, dependent: :destroy
  has_one :starter_pack, through: :user_starter_pack

  has_many :products
  has_many :purchases, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  serialize :invited_ids, Array

  validates :role, acceptance: { accept: ["seller", "consultant", "admin", "client", "franchise", "assembler", "finances", "support", "aquisition"] }
  validates :graduation, acceptance: { accept: ["sênior", "bronze", "prata", "ouro", "diamante", "imperial"] }
  validates :plan, acceptance: { accept: ["consultor", "revendedor", "kit start"] }

  validates_uniqueness_of :invitation_token, only: :update
  validates_uniqueness_of :social_security_number, only: :update, :unless => lambda { self.tax_number.present? }
  validates_uniqueness_of :tax_number, only: :update, :unless => lambda { self.social_security_number.present? }

  accepts_nested_attributes_for :address, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :bank_account_information, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :credit_information, allow_destroy: :false, reject_if: :all_blank
  accepts_nested_attributes_for :user_starter_pack, allow_destroy: false, reject_if: :all_blank

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

  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  def clear_shopping_cart(purchase)
    self.shopping_cart.shopping_cart_items.each do |item|
      purchase.purchase_items.create(size: item.size, quantity: item.quantity, product_id: item.product_id, purchase_id: purchase.id)
      new_quantity = item.product.sizes.where(:name => item.size).first.quantity.to_i - item.quantity
      item.product.sizes.where(:name => item.size).first.update_attribute(:quantity, new_quantity)
      item.destroy
    end
  end

  def generate_volume(purchase)
    if self.invited_by_id.present?
      check = false
      user = User.find(self.invited_by_id)

      until check
        sales_volume = purchase.value.to_f
        user_sales_volume = user.sales_volume.to_f
        user.sales_volume = (user_sales_volume + sales_volume).to_s
        user.save

        if user.invited_by_id.present?
          user = User.find(user.invited_by_id)
        else
          check = true
        end
      end
    end
  end

  def generate_commission(purchase)
    if self.invited_by_id.present?
      user = User.find(self.invited_by_id)
      check = true

      6.times do |index|
        if check
          commission = purchase.value.to_f * 0.05 if index == 0
          commission = purchase.value.to_f * 0.006 if index > 0

          user_balance = user.balance.to_f

          user.balance = (user_balance + commission).round(2).to_s
          user.save

          if user.invited_by_id.present?
            user = User.find(user.invited_by_id)
          else
            check = false
          end
        end
      end
    end
  end

  def activate_account_with_balance(resource)
    case resource.plan
    when "consultor"
      value = 10.00
    when "revendedor"
      value = 20.00
    when "kit start"
      value = resource.user_starter_pack.starter_pack.price.to_f
    end

    if not resource.activated
      if self.balance.to_f >= value
        resource.update_attribute(:activated, true)
        self.update_attribute(:balance, self.balance.to_f - value)

        if resource.plan == "kit start"
          purchase = resource.purchases.last
          purchase.update_attribute(:status, "pagamento confirmado")
          purchase.user.generate_volume(purchase)
          purchase.user.generate_commission(purchase)
          purchase.create_assemble_order
          purchase.create_purchase_order
        end
      end

      ActivationRequest.where(:user_id => self.id, :requested_id => resource.id).first.destroy
    end
  end

  def check_selected_products_quantity
    check = true

    self.shopping_cart.shopping_cart_items.each do |item|
      if item.product.sizes.where(:name => item.size).first.quantity.to_i < item.quantity
        check = false
      end
    end

    return check
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
      self.role = "seller" unless ["aquisition", "assembler", "support", "finance"].include? current_user.role
      self.activated = true

      until self.valid?
        self.invitation_token = SecureRandom.urlsafe_base64(5)
      end
    end

    self.save
  end

  def create_shopping_cart
    self.build_shopping_cart
    self.save
  end

  def generate_user_url
    url = UrlMinifier.new(user_id: self.id, code: self.invitation_token)
    url.number = rand(100000..999999)

    while url.class.exists?(number: url.number)
      url.number = rand(100000..999999)
    end
    url.save
  end
end
