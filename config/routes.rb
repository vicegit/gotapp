Rails.application.routes.draw do
  get 'dashboard/index'

  resources :ctacteclis
  resources :periodos
  resources :lecturas
  resources :servicios
  resources :clientes
  resources :facturas
  devise_for :users
  post "facturas/facturar"
  post "facturas/reportefactura"
  get 'home/index' 
  get 'dashboard/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
