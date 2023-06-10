Rails.application.routes.draw do
  devise_for :users
  root "splash#index"

  resources :splash, only: [:index]
end
