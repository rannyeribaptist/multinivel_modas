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
      purchase.purchase_items.create(size: item.size, quantity: item.quantity, product_id: item.product_id, purchase_id: purchase.id)
      item.destroy
    end
  end
end
