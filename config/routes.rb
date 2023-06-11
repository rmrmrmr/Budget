Rails.application.routes.draw do
  devise_for :users
  root "splash#index"

  resources :splash, only: [:index] do
    resources :groups, only: [:index, :new, :create, :show] do
      resources :items, only: [:new, :create]
    end
  end
end
