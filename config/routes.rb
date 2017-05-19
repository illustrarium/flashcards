Rails.application.routes.draw do

  resources :cards
  get 'home/index'
  post 'home/check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
end
