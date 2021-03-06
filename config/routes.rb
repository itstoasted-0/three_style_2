Rails.application.routes.draw do
  root to: "pages#top"
  devise_for :users, controllers: {
            registrations: "users/registrations",
            passwords: "users/passwords",
  }
  devise_scope :user do
    get "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
