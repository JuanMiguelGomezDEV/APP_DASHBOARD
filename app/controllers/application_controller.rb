class ApplicationController < ActionController::Base
  helper_method :current_user
 
  private
  def current_user
    @current_user ||= User.first
  end
 
  def require_user!
    redirect_to new_user_path, alert: "Crea un usuario primero" unless current_user
  end
end
