Rails.application.routes.draw do
  # Página principal del sitio
  root "dashboard#index"

  # Autenticación con Devise (usando controladores personalizados)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # Ruta de health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas opcionales para PWA (descomentarlas si las usas)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  
end
