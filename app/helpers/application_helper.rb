module ApplicationHelper
  def show_flash_messages
    if flash.any?
      flash.each do |f|
        return ("<div class='flash flash--#{f[0]} animated fadeInDown'>#{f[1]}</div>").html_safe
      end
    end
  end

  def define_admin
    redirect_to user_dashboard_path if not current_user.role == "admin"
  end

  def translate_role(role)
    case role
    when "seller"
      return "Fornecedor"
    when "consultant"
      return "Consultor"
    when "admin"
      return "Administrador"
    when "client"
      return "Cliente"
    when "franchise"
      return "Franquiado"
    else
      return "Permissão indefinida"
    end
  end

  def translate_boolean(bool)
    if bool.present?
      bool == true ? "Sim" : "Não"
    else
      return "Sim"
    end
  end

  def sum_items(cart)
    total = 0

    cart.shopping_cart_items.each do |item|
      total += item.product.price.to_f * item.quantity
    end

    return total
  end

  def show_price(cart)
    value = sum_items(cart)
    return "R$ " + value.to_s.gsub(".", ",")
  end

  def format_price(value)
    return "R$ " + value.to_s.gsub(".", ",")
  end

  def atttribute_sales_volume(pruchase)
    value = purchases.value
    user_id = current_user.invited_by_id
    amount = Config.sales_volume_percent * purchase.value
    user = User.find_by_id(user_id)

    while user.invited_by_id.present? do
      user.sales_volume.to_f += amout
      user_id = user.invited_by_id
      user = User.find_by_id(user_id)
    end
  end

  def clear_shopping_cart(cart, purchase)
    cart.shopping_cart_items.each do |item|
      purchase.purchase_items.new(size: item.size, quantity: item.quantity, product_id: item.product_id, purchase_id: purchase.id)
      item.destroy
    end
  end

  # def create_purchase_order(order)
  #   order.order_items.each do |item|
  #     product = Product.find_by_location(item.product_reference)
  #     PurchaseOrder.create(product_id: item.order_id, quantity: item.quantity, status: "Pendente Pagamento") if product.present?
  #   end
  # end
  #
  # def create_assemble(order)
  #   assembler = set_assembler()
  #
  #   order.order_items.each do |item|
  #     item.update_attribute(:status, "Em estoque")
  #   end
  #
  #   assemble = Assemble.create(order_id: order.id, user_id: assembler, status: "Pendente montagem")
  # end

  def update_products_quantity(order)
    order.order_items.each do |item|
      current_quantity = Product.find_by_location(item.product_reference).quantity
      quantity = current_quantity.to_i - item.quantity.to_i
      Product.find_by_location(item.product_reference).update_attribute(:quantity, quantity)
    end
  end

  def update_product_quantity(item_id)
    item OrderItem.find_by_id(item_id)
    current_quantity = Product.find_by_location(item.product_reference).quantity
    quantity = current_quantity.to_i - item.quantity.to_i

    Product.find_by_location(item.product_reference).update_attribute(:quantity, quantity)
  end

  # def set_assembler
  #   order = AssembleOrder.first
  #
  #   if (order.assembler_list.find_index(order.next_assembler)) == (order.assembler_list.length.to_i - 1)
  #     next_assembler_index = order.assembler_list.first
  #   else
  #     next_assembler_index = order.assembler_list[find_index(order.next_assembler) + 1]
  #   end
  #
  #   order.last_assembler = order.next_assembler
  #   order.next_assembler = next_assembler_index
  #
  #   return order.next_assembler
  # end

  def set_plan_value(plan)
    case plan
    when "consultor"
      return "10.00"
    when "revendedor"
      return "20.00"
    when "kit start"
      return current_user.user_starter_pack.starter_pack.price
    end
  end

  def verify_payment_status(payment)
    case payment["response"]["status"]
    when "400"
      return false
    when 400
      return false
    when "rejected"
      return false
    else
      return true
    end
  end

  def payment_response(status)
    status = status.to_s

    case status
    when "accredited"
      return "Pagamento aprovado!"
    when "pending_contingency"
      return "Não se preocupe, em menos de 2 dias úteis informaremos por e-mail se foi creditado."
    when "pending_review_manual"
      return "Estamos processando seu pagamento. Não se preocupe, em menos de 2 dias úteis informaremos por e-mail se foi creditado ou se necessitamos de mais informação."
    when "cc_rejected_bad_filled_card_number"
      return "Revise o número do cartão."
    when "cc_rejected_bad_filled_date"
      return "Revise a data de vencimento."
    when "cc_rejected_bad_filled_other"
      return "Revise os dados."
    when "cc_rejected_bad_filled_security_code"
      return "Revise o código de segurança do cartão."
    when "cc_rejected_blacklist"
      return "Não pudemos processar seu pagamento."
    when "cc_rejected_call_for_authorize"
      return "Você deve autorizar à sua operadora do cartão o pagamento do valor solicitado pelo Mercado Pago."
    when "cc_rejected_card_disabled"
      return "Ligue para o à sua operadora do cartão para ativar seu cartão. O telefone está no verso do seu cartão."
    when "cc_rejected_card_error"
      return "Não conseguimos processar seu pagamento."
    when "cc_rejected_duplicated_payment"
      return "Você já efetuou um pagamento com esse valor. Caso precise pagar novamente, utilize outro cartão ou outra forma de pagamento."
    when "cc_rejected_high_risk"
      return "Seu pagamento foi recusado. Escolha outra forma de pagamento. Recomendamos meios de pagamento em dinheiro."
    when "cc_rejected_insufficient_amount"
      return "O cartão selecionado não possui saldo insuficiente."
    when "cc_rejected_invalid_installments"
      return "O cartão selecionado não processa pagamentos na quantidade de parcelas selecionadas."
    when "cc_rejected_max_attempts"
      return "Você atingiu o limite de tentativas permitido. Escolha outro cartão ou outra forma de pagamento."
    when "cc_rejected_other_reason"
      return "Sua operadora do cartão não processou o pagamento."
    when "205"
      return "Digite o número do seu cartão."
    when "208"
      return "Escolha um mês."
    when "209"
      return "Escolha um ano."
    when "212"
      return "Informe seu documento."
    when "213"
      return "Informe seu documento."
    when "214"
      return "Informe seu documento."
    when "220"
      return "Informe seu banco emissor."
    when "221"
      return "Digite o nome e sobrenome."
    when "224"
      return "Digite o código de segurança."
    when "E301"
      return "Há algo de errado com esse número. Digite novamente."
    when "E302"
      return "Confira o código de segurança."
    when "316"
      return "Por favor, digite um nome válido."
    when "322"
      return "Confira seu documento."
    when "323"
      return "Confira seu documento."
    when "324"
      return "Confira seu documento."
    when "325"
      return "Confira a data."
    when "326"
      return "Confira a data."
    when "106"
      return "Não pode efetuar pagamentos a usuários de outros países."
    when "109"
      return "A operadora do cartão não processa pagamentos parcelados."
    when "126"
      return "Escolha outro cartão ou outra forma de pagamento."
    when "129"
      return "Não conseguimos processar seu pagamento. Escolha outro cartão ou outra forma de pagamento."
    when "145"
      return "Uma das partes com a qual está tentando realizar o pagamento é um usuário de teste e a outra é um usuário real."
    when "150"
      return "Você não pode efetuar pagamentos."
    when "151"
      return "Você não pode efetuar pagamentos."
    when "160"
      return "Não conseguimos processar seu pagamento."
    when "204"
      return "A operadora do cartão não está disponível nesse momento. Escolha outro cartão ou outra forma de pagamento."
    when "801"
      return "Você realizou um pagamento similar há poucos instantes. Tente novamente em alguns minutos."
    when "400"
      return "Verifique seus dados pessoais e os dados de pagamento e tente novamente."
    when "default"
      return "Confira os dados."
    else
      return status
    end
  end

  def translate_payment_method(method)
    case method.downcase
    when "credit_card"
      return "Cartão de crédito"
    when "ticket"
      return "Boleto/Lotérica"
    when "credit card"
      return "Cartão de crédito"
    else
      return method
    end
  end
end
