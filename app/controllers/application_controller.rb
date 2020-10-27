class ApplicationController < ActionController::Base
    
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  def authenticate_user
    if current_user == nil
      redirect_to new_user_session_path, notice: "ログインが必要です"
    end
  end
    
  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to users_path, notice: "権限がありません"
    end
  end
    
end
