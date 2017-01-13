Rails.application.routes.draw do
  root 'prospects#index'
  get 'package/index'

  get 'package/show'

  get 'package/load'

  get 'prospects/next'

  resources :prospect_contents
  resources :prospects
  resources :contents
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
