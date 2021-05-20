Rails.application.routes.draw do
  root to: "pages#top"
  devise_for :users
  resources :posts
  resource :users, only: :show
end
