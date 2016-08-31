Rails.application.routes.draw do
  resources :clientes
  devise_for :users
  root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
