class UrlMinifiersController < ApplicationController
  before_action :set_url

  def redirect_url
    redirect_to "/users/sign_up?token=#{@url_minifier.code}"
  end

  private

  def set_url
    @url_minifier = UrlMinifier.find_by_number(params[:number])
  end
end
