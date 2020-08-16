class ApplicationController < ActionController::Base
  include ApplicationHelper

  def settings
    @categories = ProductCategory.all
    @sizes = ProductSize.all
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
        redirect_to validate_plan_path if not request.path == "/concluir_assinatura"
      end
    end
  end
end
