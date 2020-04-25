class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_search
  protected

  def configure_permitted_parameters
    added_attrs = [ :first_name, :family_name, :first_name_reading, :family_name_reading, :nickname, :email, :birthday, :phone_number ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def production?
    Rails.env.production?
    # 本番環境ならtrue ローカルならfalseを返す by うえやま
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_search
    @search = Item.ransack(params[:q])
  end

end
