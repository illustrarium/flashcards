Rails.application.routes.draw do
  get 'cards/index'

  resources :cards
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
end
