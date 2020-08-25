class ApplicationController < ActionController::Base
  include ApplicationHelper

  def settings
    @categories = ProductCategory.all
    @sizes = ProductSize.all
    @starter_packs = StarterPack.all
  end

  def validate_registration_of_current_user
    if current_user.present?
      if not current_user.completed_registration?
        redirect_to finish_registration_path if not request.path == "/concluir_cadastro"
      end
    end
  end

  def validate_activation_of_current_user
    if current_user.present?
      if current_user.completed_registration? and not current_user.activated?
        if current_user.purchases.any?
          redirect_to purchase_path(current_user.purchases.first) if not request.path.include? "/purchases"
        else
          redirect_to validate_plan_path if not request.path == "/concluir_assinatura"
        end
      end
    end
  end
end
