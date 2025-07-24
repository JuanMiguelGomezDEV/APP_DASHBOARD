class ApplicationController < ActionController::Base
  # Solo permitir navegadores modernos
  allow_browser versions: :modern

  # Obliga a estar autenticado en todo el sitio
  before_action :authenticate_user!

  # Redirección después del logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
