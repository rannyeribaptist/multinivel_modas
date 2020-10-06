class ActivationRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :requested_id

  def proccess_request
    requester = User.find(self.requested_id)
    activator = User.find(self.user_id)

    if requester.plan == "kit start"
      purchase = Purchase.create(
                                 user_id: requester.id,
                                 address: requester.address,
                                 value: requester.user_starter_pack.starter_pack.price,
                                 status: "Aguardando confirmação de pagamento",
                                 payment_method: "Saldo"
                                )
    end
  end
end
