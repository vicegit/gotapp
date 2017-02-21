Rails.application.routes.draw do
  get 'dashboard/index'

  resources :medidors
  resources :clientes
  resources :periodos
  resources :lecturas
  resources :servicios
  resources :facturas
  resources :ctacteclis
  devise_for :users
  post "facturas/facturar"
  post "facturas/reportefactura"
  get 'home/index' 
  get 'dashboard/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
