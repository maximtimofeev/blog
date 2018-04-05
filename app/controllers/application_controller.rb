class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  prepend_view_path Rails.root.join("frontend")

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
