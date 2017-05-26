Rails.application.routes.draw do

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :user_sessions
  resources :users
  resources :cards
  resources :decks
  get 'home/index'
  post 'home/check'
  post 'decks/set_current'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
end
