class ApplicationController < ActionController::Base
	before_action :profile_name, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def profile_name
    devise_parameter_sanitizer.for(:sign_up) << :profile_name
  end
end
