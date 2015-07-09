Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  authenticate :user do
    resources :beaches, only: [:new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :amenities

    resources :users, only: [:index, :destroy]
  end

  resources :beaches, only: [:index, :show] do
    resources :reviews, only: [:index, :show]
  end

  resources :reviews do
    resources :upvotes
    resources :downvotes
  end
end
