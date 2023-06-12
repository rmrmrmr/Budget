Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#splash', as: :unauthenticated_root
    end
  end

  resources :groups, only: [:new, :index, :create, :show] do
    resources :items, only: [:new, :create]
  end
end
