class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end

  # include SessionsHelper

  # private
  # def logged_in_user
  # 	unless logged_in?
  # 		flash[:danger] = "Please log in!"
  # 		redirect_to log_in
  # 	end
  # end

  # def admin_user
  # 	render text: "Forbidden", status: :forbidden unless current_user.admin?
  # end

end
