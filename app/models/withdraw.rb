class Withdraw < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :status, :amount
  validate :verify_user_balance, :validate_minimum_amount, on: :create

  after_create :compensate_user_balance

  private

  def validate_minimum_amount
    if self.amount >= 90.00
      return true
    else
      self.errors.add(:amount, "O saldo mínimo necessário para solicitar um saque é de R$ 90,00")
      return false
    end
  end

  def verify_user_balance
    balance = self.user.balance.to_f

    if balance >= self.amount
      return true
    else
      self.errors.add(:amount, "Você não possui saldo suficiente para solicitar este saque")
      return false
    end
  end

  def compensate_user_balance
    balance = self.user.balance.to_f
    updated_value = balance - self.amount
    self.user.update_attribute(:balance, updated_value)
  end
end
