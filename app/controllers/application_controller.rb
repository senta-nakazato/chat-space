class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:index, :edit]
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resouce)
    root_path
   end


 private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:account_upgrade, keys: [:name, :email])
    end
end

