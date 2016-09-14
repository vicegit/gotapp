Rails.application.routes.draw do
  resources :facturas
  resources :periodos
  resources :lecturas
  resources :servicios
  resources :clientes
  devise_for :users
  root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
