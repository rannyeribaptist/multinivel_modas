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
      return "Não entendi seu nível de permissão filhão..."
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

    return show_price(total)
  end

  def show_price(price)
    return "R$ " + price.to_s.gsub(".", ",")
  end
end
