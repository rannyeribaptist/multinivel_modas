class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :validate_registration_of_current_user

  private

  def validate_registration_of_current_user
    if current_user.present?
      if not current_user.address.present?
        redirect_to finish_registration_path if not request.path == "/concluir_cadastro"
      end
    end
  end
end
